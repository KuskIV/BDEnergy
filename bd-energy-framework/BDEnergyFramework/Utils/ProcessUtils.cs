using BDEnergyFramework.Exceptions;
using Microsoft.Extensions.Logging;
using Spectre.Console;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Utils
{
    public static class ProcessUtils
    {
        public static void AssignPriorityToFramework()
        {
            var process = System.Diagnostics.Process.GetCurrentProcess();

            if (DutUtils.IsWindows())
            {
                process.PriorityClass = System.Diagnostics.ProcessPriorityClass.High; // TODO: do this
            }
        }

        public static void ExecuteWindowsTestCaseWithParameters(string testCaseParameter, string testCasePath, List<int> enabledCores, ILogger logger)
        {
            if (testCasePath == TestCaseUtils.IDLE)
            {
                Thread.Sleep(TimeSpan.FromMinutes(1));
                return;
            }
            else if (testCasePath == TestCaseUtils.MARK3D)
            {
                Execute3DMark(testCasePath, enabledCores, logger);

                return;
            }
            else if (testCasePath == TestCaseUtils.PCMARK)
            {
                var startTime = DateTime.UtcNow;

                TabMultipleTimes();

                logger.Information("Starting {name}", testCasePath);

                while (!IsPCMarkDone(startTime))
                {
                    SetAffinityOfProcessesForPCMark(enabledCores);

                    Thread.Sleep(
                        TimeSpan.FromMilliseconds(500));
                }

                logger.Information("Stopping {name}", testCasePath);

                if (IsPCMarkFileError(startTime))
                {
                    throw new Mark3DContainedErrorException();
                }

                return;
            }

            var executablePath = testCasePath;
            var parameters = testCaseParameter;

            var process = new Process();
            process.StartInfo.FileName = "\"" + executablePath + "\"";
            process.StartInfo.Arguments = parameters;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.Start();

            if (enabledCores.Any())
            {
                var processorAffinity = ProcessorAffinityGenerator.GenerateProcessorAffinity(enabledCores);
                process.ProcessorAffinity = processorAffinity;
            }
            var output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();

            // Get the exit code of the process
            var exitCode = process.ExitCode;

            logger.Information("Test case '{tc}' exited with exit code '{exitCode}'",
                PathUtils.GetFilenameFromPath(testCasePath), exitCode);
        }

        private static void Execute3DMark(string testCasePath, List<int> enabledCores, ILogger logger)
        {
            var startTime = DateTime.UtcNow;

            while (ProcessNotRunning("3DMarkCPUProfile"))
            {
                LeftClick();
                Thread.Sleep(
                    TimeSpan.FromSeconds(1));
            }

            logger.Information("Starting {name}", testCasePath);

            while (!Is3DMarkDone(startTime))
            {
                SetAffinityOfProcessesFor3DMark(enabledCores);

                Thread.Sleep(
                    TimeSpan.FromMilliseconds(500));
            }

            logger.Information("Stopping {name}", testCasePath);

            if (Is3DMarkFileError(startTime))
            {
                throw new Mark3DContainedErrorException();
            }
        }

        private static bool ProcessNotRunning(string processName)
        {
            var processes = Process.GetProcessesByName(processName);

            return !processes.Any();
        }

        private static void LeftClick()
        {
            var ahkPath = "left-click.exe";
            var p = new Process();
            p.StartInfo.FileName = ahkPath;
            p.Start();
        }

        private static void TabMultipleTimes()
        {
            var ahkPath = "start-pcmark.exe";
            var p = new Process();
            p.StartInfo.FileName = ahkPath;
            p.Start();
        }

        private static void SetAffinityOfProcessesFor3DMark(List<int> enabledCores)
        {
            var processes = new List<string>()
            {
                "3DMarkCPUProfile",
            };

            SetAffinityOfProcesses(processes, enabledCores);
        }

        private static void SetAffinityOfProcessesForPCMark(List<int> enabledCores)
        {
            var runningProcesses = Process.GetProcesses();

            var processes = runningProcesses
                .Select(x => x.ProcessName)
                .Where(x => x.Contains("PCMark10-")).ToList();
                            
            SetAffinityOfProcesses(processes, enabledCores);
        }

        private static void SetAffinityOfProcesses(List<string> processNames, List<int> enabledCores)
        {
            if (!enabledCores.Any())
            {
                return;
            }

            foreach (var name in processNames)
            {
                var processes = Process.GetProcessesByName(name);

                foreach (var p in processes)
                {
                    var processorAffinity = ProcessorAffinityGenerator.GenerateProcessorAffinity(enabledCores);
                    p.ProcessorAffinity = processorAffinity;
                }
            }
        }

        private static bool Is3DMarkFileError(DateTime startTime)
        {
            var path = PathUtils.DataFolderPath + "/" + "3DMark";

            var files = Directory.GetFiles(path);

            var file = files.First(x => x.EndsWith(".3dmark-result") && File.GetCreationTimeUtc(x) > startTime);

            return file.Contains("FAILED");
        }

        private static bool IsPCMarkFileError(DateTime startTime)
        {
            var path = PathUtils.DataFolderPath + "/" + "PCMark 10";

            var files = Directory.GetFiles(path);

            var file = files.First(x => x.EndsWith(".pcmark10-result") && File.GetCreationTimeUtc(x) > startTime);

            return file.Contains("FAILED");
        }

        private static bool Is3DMarkDone(DateTime startTime)
        {
            var path = PathUtils.DataFolderPath + "/" + "3DMark";

            var files = Directory.GetFiles(path);

            if (files.Any(x => x.EndsWith(".3dmark-result") && File.GetCreationTimeUtc(x) > startTime))
            {
                return true;
            }

            return false;
        }

        private static bool IsPCMarkDone(DateTime startTime)
        {
            var path = PathUtils.DataFolderPath + "/" + "PCMark 10";

            var files = Directory.GetFiles(path);

            if (files.Any(x => x.EndsWith(".pcmark10-result") && File.GetCreationTimeUtc(x) > startTime))
            {
                return true;
            }

            return false;
        }

        public static void ExecuteLinuxTestCaseWithParameters(string testCaseParameter, string testCasePath, List<int> enabledCores, ILogger logger)
        {
            var executablePath = testCasePath;
            var parameters = testCaseParameter;
            
            var process = new Process();
            process.StartInfo.FileName = executablePath;
            process.StartInfo.Arguments = parameters;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.Start();

            if (enabledCores.Any())
            {
                var processorAffinity = ProcessorAffinityGenerator.GenerateProcessorAffinity(enabledCores);
                process.ProcessorAffinity = processorAffinity;
            }
            var output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();

            // Get the exit code of the process
            var exitCode = process.ExitCode;

            logger.Information("Test case '{tc}' exited with exit code '{exitCode}'",
                PathUtils.GetFilenameFromPath(testCasePath), exitCode);
        }
    }
}
