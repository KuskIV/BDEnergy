using Microsoft.Extensions.Configuration;
using RaspberryEnergyProcessing.Handlers;
using RaspberryEnergyProcessing.Model;
using RaspberryEnergyProcessing.Utils;

IConfiguration config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();

FileHandler fileHandler = new FileHandler("C:\\Users\\Jeppe\\Desktop\\Scope");
fileHandler.Start(DateTime.Now);
await Task.Delay(TimeSpan.FromSeconds(5));
fileHandler.Stop(DateTime.Now);
var files = fileHandler.GetFiles();
List<Measurements> measurements = new List<Measurements>();
foreach (var file in files)
{
    measurements.Add(new Measurements(FileUtils.GetStartTime(file) ,fileHandler.OpenFile(file)));
}
TimeSliceHandler sliceHandler = new TimeSliceHandler(measurements);
List<Measurement> res = sliceHandler.SelectRelevantPeriod(fileHandler.GetStartTime(), fileHandler.GetEndTime());
var dbHandler = new DatabaseHandler(config["ConnectionStrings:MySqlConnection"]);
dbHandler.InsertResults(res);



