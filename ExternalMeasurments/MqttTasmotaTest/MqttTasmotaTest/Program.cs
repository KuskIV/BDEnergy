using System;
using System.Text;
using System.Threading.Tasks;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Protocol;

namespace TasmotaMQTTExample
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var mqttClient = new MqttFactory().CreateMqttClient();

            mqttClient.ConnectedAsync += (async eventArgs =>
            {
                Console.WriteLine("Connected to the MQTT broker.");
                await mqttClient.SubscribeAsync("tasmota/+/RESULT");
                Console.WriteLine("Subscribed to 'tasmota/+/RESULT' topic.");
            });

            mqttClient.DisconnectedAsync += (async eventArgs =>
            {
                Console.WriteLine("Disconnected from the MQTT broker.");
                await Task.Delay(TimeSpan.FromSeconds(5));
                try
                {
                    await mqttClient.ConnectAsync(new MqttClientOptionsBuilder()
                        .WithClientId("MyClientID")
                        .WithTcpServer("your.mqtt.broker.address")
                        .Build());
                }
                catch
                {
                    Console.WriteLine("Reconnecting to the MQTT broker failed.");
                }
            });

            mqttClient.ApplicationMessageReceivedAsync += async eventArgs =>
            {
                string message = Encoding.UTF8.GetString(eventArgs.ApplicationMessage.Payload);
                Console.WriteLine($"Received message: {message}");
            };

            try
            {
                await mqttClient.ConnectAsync(new MqttClientOptionsBuilder()
                    .WithClientId("MyClientID")
                    .WithTcpServer("your.mqtt.broker.address")
                    .Build());
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Connection failed: {ex.Message}");
            }

            Console.WriteLine("Press ENTER to send a command to the Tasmota device.");
            Console.ReadLine();

            var commandMessage = new MqttApplicationMessageBuilder()
                .WithTopic("tasmota/your_device/cmnd/Power")
                .WithPayload("TOGGLE")
                .WithQualityOfServiceLevel(MqttQualityOfServiceLevel.ExactlyOnce)
                .WithRetainFlag()
                .Build();

            await mqttClient.PublishAsync(commandMessage);

            Console.WriteLine("Command sent. Press any key to exit.");
            Console.ReadLine();

            await mqttClient.DisconnectAsync();
        }
    }
}
