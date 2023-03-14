using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BBPlug.devices
{
    public interface ISmartDevice
    {
        string? ip { get; set; }
        bool online { get; set; }
        bool state { get; }
        Task CheckStatus();

    }
}
