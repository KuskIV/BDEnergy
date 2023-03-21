using BBPlug.devices;
using Microsoft.Extensions.Configuration;
using RspMeasuringDevice;
using System.Linq;

IConfiguration config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();
List<Plug> plugs = new List<Plug>
{
    new Plug("192.168.1.182")
    //new Plug("192.168.1.150")
};
DatabaseHandler databaseHandler = new DatabaseHandler(config["ConnectionStrings:MySqlConnection"]);
//List<string> log = new List<string>();
//int i = 0;
while (true) 
{
    databaseHandler.ÓpenConnection();
    foreach (var plug in plugs)
	{
        var plugState = plug.Status;
        if (plugState != null) 
        {
            databaseHandler.InsertResults(plugState, plug.ip);
            //log.Add($"Measured: {plugState.Power}, at {DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff")}");
        }
        else
        {
            continue;
        }
	}
    databaseHandler.CloseConnection();
    //i++;
    //if(i % 100 == 0) 
    //{
    //    Console.WriteLine(string.Join('\n',log));
    //}
    Thread.Sleep(TimeSpan.FromSeconds(0.1));
}