using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class PathUtils
    {
        public static string DataFolderPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
        public static string DefaultFolderName = "10-experiment-data";

        public static string GetResultPathForMeasuringInstrument(EMeasuringInstrument mi, DateTime date)
        {

            string fileName = GetFileName(date);
            string root = GetPathForSource(mi.ToString()).Replace("\\", "/");

            if (!System.IO.Directory.Exists(root))
            {
                System.IO.Directory.CreateDirectory(root);
            }

            var path = new StringBuilder().AppendFormat(@"{0}/{1}.csv", root, fileName).ToString();

            return path;
        }



        public static string GetFilenameFromPath(string path)
        {
            return Path.GetFileName(path);
        }

        public static string GetFileName(DateTime date)
        {
            return date.ToString("yyyy-MM-dd-hh-mm-ss");
        }

        public static string GetPathForSource(string source)
        {
            return DataFolderPath + "/" + DefaultFolderName + "/" + source;
        }
    }
}
