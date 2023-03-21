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
databaseHandler.ÓpenConnection();
while (true) 
{
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
}
