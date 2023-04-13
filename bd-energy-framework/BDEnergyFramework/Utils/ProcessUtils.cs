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
            }
            else if (testCasePath == TestCaseUtils.MARK3D)
            {
                var startTime = DateTime.UtcNow;
                var ahkPath = "left-click.exe";
                var p = new Process();
                p.StartInfo.FileName = ahkPath;
                p.Start();

                while (!Is3DMarkDone(startTime))
                {
                    SetAffinityOfProcessesFor3DMark(enabledCores);

                    Thread.Sleep(
                        TimeSpan.FromMilliseconds(500));
                }

                if (Is3DMarkFileError(startTime))
                {
                    throw new Mark3DContainedErrorException();
                }

                return;
            }
            else if (testCasePath == TestCaseUtils.PCMARK)
            {
                throw new NotImplementedException("PCMARK is yet to be implemented");
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

        private static void SetAffinityOfProcessesFor3DMark(List<int> enabledCores)
        {
            var processes = new List<string>()
            {
                "3DMarkCPUProfile",
            };

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
