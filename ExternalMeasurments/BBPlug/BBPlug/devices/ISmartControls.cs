using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BBPlug.devices
{
    public interface ISmartControls
    {
        Task<bool> ToggleAsync();
        Task TurnOnAsync();
        Task TurnOffAsync();
        HtmlDocument SendCmd(string command);
        Task<HttpResponseMessage?> SendRequest(string url);
    }
}
