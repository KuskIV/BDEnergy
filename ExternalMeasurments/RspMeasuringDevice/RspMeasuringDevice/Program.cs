using Microsoft.Extensions.Configuration;
using RspMeasuringDevice;

IConfiguration config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();

string BasePath = "/home/rsp/Desktop/Scope";
FileHandler fileHandler = new FileHandler(BasePath);
DatabaseHandler databaseHandler = new DatabaseHandler(config["ConnectionStrings:MySqlConnection"]);
while (true) 
{
    var files = fileHandler.GetFiles();
    Thread.Sleep(500);
    databaseHandler.ÓpenConnection();
    for (int i = 0; i < files.Count; i += 2)
    {
        List<Measurements> measurements1 = new();
        List<Measurement> ms1 = new List<Measurement>();
        measurements1.Add(new Measurements(FileUtils.GetStartTime(files[i]), fileHandler.OpenFile(files[i])));
        List<List<Measurement>> md1 = measurements1.Select(x => x.measurements).ToList();
        md1.ForEach(x => ms1.AddRange(x));
        await databaseHandler.InsertResults(ms1);
        //Clean Up
        ms1.Clear();

        if (i + 1 < files.Count)
        {
            List<Measurements> measurements2 = new();
            List<Measurement> ms2 = new List<Measurement>();
            measurements2.Add(new Measurements(FileUtils.GetStartTime(files[i + 1]), fileHandler.OpenFile(files[i + 1])));
            List<List<Measurement>> md2 = measurements2.Select(x => x.measurements).ToList();
            md2.ForEach(x => ms2.AddRange(x));
            databaseHandler.InsertResults(ms2);
            //Clean Up
            ms2.Clear();
        }
    }

    foreach (var file in files)
    {
        FileUtils.RemoveFile(file);
    }
    databaseHandler.CloseConnection();

}