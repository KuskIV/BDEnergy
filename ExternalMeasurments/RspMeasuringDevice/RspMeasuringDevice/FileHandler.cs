using Polly;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RspMeasuringDevice
{
    public class FileHandler
    {
        private readonly string _path;
        private DateTime startTime;
        private DateTime endTime;
        public List<string> files { get { return FileUtils.GetFiles(_path).ToList(); } }

        public FileHandler(string path)
        {
            _path = path;
        }

        public void Start(DateTime dateTime)
        {
            FileUtils.RemoveFiles(_path);
            startTime = dateTime;
        }

        //public void Stop(DateTime dateTime)
        //{
        //    endTime = dateTime;
        //    while (files.Count == 0 || CheckFileTime(files.Last()))
        //    {
        //        files = FileUtils.GetFiles(_path).ToList();
        //    }
        //}

        public string OpenFile(string path, int retryCount = 30, int delayMs = 500)
        {
            var policy = Policy
            .Handle<IOException>()
            .WaitAndRetry(retryCount, i => TimeSpan.FromMilliseconds(delayMs));

            return policy.Execute(() => {
                try
                {
                    return File.ReadAllText(path);
                }
                catch (IOException ex)
                {
                    Console.WriteLine($"Error reading file: {ex.Message}");
                    throw new FileNotFoundException(path);
                }
            });
        }

        public List<string> GetFiles()
        {
            return files;
        }
    }
}
