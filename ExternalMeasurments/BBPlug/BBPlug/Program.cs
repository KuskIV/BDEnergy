using BBPlug.devices;
using Microsoft.Extensions.Configuration;
using RspMeasuringDevice;

IConfiguration config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();
List<Plug> plugs = new List<Plug>
{
    new Plug("192.168.1.182")
};
DatabaseHandler databaseHandler = new DatabaseHandler(config["ConnectionStrings:MySqlConnection"]);
while (true) 
{
    databaseHandler.ÓpenConnection();
	foreach (var plug in plugs)
	{
        var plugState = plug.Status;
        if (plugState != null) 
        {
            databaseHandler.InsertResults(plugState, plug.ip);
        }
        else
        {
            continue;
        }
	}
    databaseHandler.CloseConnection();
    Thread.Sleep(TimeSpan.FromSeconds(0.5));
}