using Microsoft.Extensions.Configuration;
using RspMeasuringDevice;
using System.Diagnostics.Metrics;
using System.Drawing.Printing;

IConfiguration config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();

string BasePath = "/home/rsp/Desktop/Scope";
//string BasePath = "C:\\Users\\Jeppe\\Desktop\\Scope";
FileHandler fileHandler = new FileHandler(BasePath);
DatabaseHandler databaseHandler = new DatabaseHandler(config["ConnectionStrings:MySqlConnection"]);
DateTime MasterTime = DateTime.MinValue;
var files = fileHandler.GetFiles();
foreach (var file in files)
{
    FileUtils.RemoveFile(file);
}
Thread.Sleep(1000);
while (true) 
{
    try
    {
        files = fileHandler.GetFiles();
        Thread.Sleep(500);
        MasterTime = DateTime.UtcNow.AddMilliseconds(-500);
        databaseHandler.ÓpenConnection();
        for (int i = 0; i < files.Count; i += 1)
        {
            List<Measurements> measurements1 = new();
            List<Measurement> ms1 = new List<Measurement>();
            measurements1.Add(new Measurements(MasterTime, fileHandler.OpenFile(files[i])));
            List<List<Measurement>> md1 = measurements1.Select(x => x.measurements).ToList();
            md1.ForEach(x => ms1.AddRange(x));
            await databaseHandler.InsertResults(ms1);
            ms1.Clear();
        }

        foreach (var file in files)
        {
            FileUtils.RemoveFile(file);
        }
        databaseHandler.CloseConnection();
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Exception encounter {ex.ToString()}");
        continue;
    }

}