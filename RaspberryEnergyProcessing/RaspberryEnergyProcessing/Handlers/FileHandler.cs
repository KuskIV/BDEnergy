using RaspberryEnergyProcessing.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Handlers
{
    public class FileHandler
    {
        private readonly string _path;
        private DateTime startTime;
        private DateTime endTime;
        private List<string> files = new();

        public FileHandler(string path)
        {
            _path = path;
        }

        public void Start (DateTime dateTime) 
        {
            FileUtils.RemoveFiles(_path);
            startTime = dateTime;
        }

        public void Stop (DateTime dateTime) 
        {
            endTime = dateTime;
            while (files.Count == 0 || CheckFileTime(files.Last()))
            {
                files = FileUtils.GetFiles(_path).ToList();
            }
        }

        public string OpenFile(string path) 
        {
            string fileContents = File.ReadAllText(path);
            return fileContents;
        }

        public List<string> GetFiles() 
        {
            return files;
        }

        public DateTime GetStartTime() 
        {
            return startTime;
        }

        public DateTime GetEndTime() 
        {
            return endTime;
        }


        private bool CheckFileTime(string file) 
        {
            string fileNameWithExtension = Path.GetFileName(file);
            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(fileNameWithExtension);
            string format = "yyyy-MM-ddTHH-mm-ss-fffZ"; // specify the custom format string
            DateTime fileTime = DateTime.ParseExact(fileNameWithoutExtension, format, System.Globalization.CultureInfo.InvariantCulture);
            return fileTime.AddSeconds(-10) < endTime;
        }

    }
}
