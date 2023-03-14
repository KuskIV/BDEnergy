using System.Diagnostics;

namespace BDEnergyFramework.Utils;

public static class LinuxUtils
{
    public static string ExecuteCommandGetOutputAsSudo(string filename, string argument)
    {
        var proc = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = "/bin/bash", //"/bin/cat",
                Arguments = string.Format("-c \"sudo {0} {1}\"", filename, argument), //argument, //"/sys/class/power_supply/BAT1/capacity",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                CreateNoWindow = true
            }
        };

        var output = "";

        proc.Start();

        var reader = proc.StandardOutput;

        output = reader.ReadToEnd();

        proc.WaitForExit();

        return output.Trim();
    }
    
    public static long ExecuteCommandGetLongOutputAsSudo(string filename, string argument)
    {
        return long.Parse(ExecuteCommandGetOutputAsSudo(filename, argument));
    }

    public static void ExecuteCommandAsSudo(string command, string argument)
    {
        var proc = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = "/bin/bash", //"/bin/cat",
                Arguments = string.Format("-c \"sudo {0} {1}\"", command, argument), //argument, //"/sys/class/power_supply/BAT1/capacity",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                CreateNoWindow = true
            }
        };

        proc.Start();
        proc.WaitForExit();
    }

    public static int ExecuteCommandGetOutput(string filename, string argument)
    {
        var proc = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = filename, //"/bin/cat",
                Arguments = argument, //"/sys/class/power_supply/BAT1/capacity",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                CreateNoWindow = true
            }
        };

        var output = "";

        proc.Start();

        var reader = proc.StandardOutput;

        output = reader.ReadToEnd();

        proc.WaitForExit();

        return int.Parse(output.Trim());
    }

    public static void ExecuteCommand(string filename, string argument)
    {
        var proc = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = filename, //"/bin/cat",
                Arguments = argument, //"/sys/class/power_supply/BAT1/capacity",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                CreateNoWindow = true
            }
        };

        proc.Start();
        proc.WaitForExit();
    }
}