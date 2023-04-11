using Microsoft.Extensions.Logging;
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
            var executablePath = testCasePath;
            var parameters = testCaseParameter;

            var process = new Process();
            process.StartInfo.FileName = "\"" + executablePath + "\"";
            process.StartInfo.Arguments = parameters;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.Start();
            //process.PriorityClass = ProcessPriorityClass.High;

            //if (DutUtils.IsWindows())
            //{
            //foreach (ProcessThread thread in process.Threads)
            //{
            //    thread.PriorityLevel = ThreadPriorityLevel.Highest;
            //}
            //}

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
