using Polly;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RspMeasuringDevice
{
    public static class FileUtils
    {
        public static void RemoveFiles(string path)
        {
            foreach (string filePath in Directory.GetFiles(path))
            {
                File.Delete(filePath);
            }
        }

        public static void RemoveFile(string path, int retryCount = 3, int delayMs = 1000) 
        {
            var policy = Policy
                .Handle<IOException>()
                .WaitAndRetry(retryCount, i => TimeSpan.FromMilliseconds(delayMs));

            policy.Execute(() => {
                try
                {
                    File.Delete(path);
                }
                catch (IOException ex)
                {
                    Console.WriteLine($"Error deleting file: {ex.Message}");
                    throw;
                }
            });
        }

        public static string[] GetFiles(string path)
        {
            return Directory.GetFiles(path).OrderBy(s => s).ToArray();
        }

        public static string SeprateFileName(string filePath)
        {
            return filePath.Split(Path.PathSeparator).Last();
        }

        public static DateTime GetStartTime(string file)
        {
            string fileNameWithExtension = Path.GetFileName(file);
            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(fileNameWithExtension);
            string format = "yyyy-MM-ddTHH-mm-ss-fffZ"; // specify the custom format string
            DateTime fileTime = DateTime.ParseExact(fileNameWithoutExtension, format, System.Globalization.CultureInfo.InvariantCulture);
            return fileTime;
        }
    }
}
