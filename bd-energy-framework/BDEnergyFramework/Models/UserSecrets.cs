﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models
{
    public record UserSecrets(
        string MachineName,
        string WifiAdapterName,
        string ConnectionString);
}
