using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BBPlug.devices
{
    public class SmartDevice : ISmartDevice, ISmartControls
    {
        public string? ip { get; set; }
        public virtual bool state { get { return ReadStateAsync().Result; } }
        public bool online { get; set; } = true;
        public SmartDevice(string ip)
        {
            this.ip = ip;
        }


        public virtual async Task<bool> ToggleAsync()
        {
            HtmlDocument _ = await PingDevice("&o=1");
            return state;
        }

        public virtual async Task TurnOnAsync()
        {
            if (!state)
            {
                HtmlDocument _ = await PingDevice("&o=1");
            }
        }
        public virtual async Task TurnOffAsync()
        {
            if (state)
            {
                HtmlDocument _ = await PingDevice("&o=1");
            }
        }

        public virtual HtmlDocument SendCmd(string command)
        {
            //http://192.168.1.85/cs?c2=78&c1=white%20100
            var url = $"http://{ip}/cs?c2=1&c1={command}";
            var response = SendRequest(url);
            online = response.IsCompleted;
            return new HtmlDocument();
        }
        private async Task<bool> ReadStateAsync()
        {
            HtmlDocument document = await PingDevice();
            if (online)
            {
                HtmlNode[] links = document.DocumentNode.SelectNodes("//td").ToArray();
                return links[0].InnerHtml.Equals("ON");
            }
            else
            {
                return false;
            }
        }

        private async Task<HtmlDocument> PingDevice(string additionalParameter = "")
        {
            var url = $"http://{ip}/?m=1" + additionalParameter;
            HttpResponseMessage? response = await SendRequest(url);
            online = response != null;
            var doc = new HtmlDocument();
            if (online)
            {
                doc.DocumentNode.InnerHtml = await response!.Content.ReadAsStringAsync();
            }
            return doc;
        }

        public async Task CheckStatus()
        {
            var url = $"http://{ip}/?m=1";
            HttpResponseMessage? response = await SendRequest(url);
            online = response != null;
        }

        public async Task<HttpResponseMessage?> SendRequest(string url)
        {
            HttpClient client = new HttpClient();
            client.Timeout = new TimeSpan(10000000);
            try
            {
                return await client.GetAsync(url);
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
