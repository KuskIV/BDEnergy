using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace RaspberryEnergyProcessing.Utils
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

        public static string[] GetFiles(string path) 
        {
            return Directory.GetFiles(path);
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
