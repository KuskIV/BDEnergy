using Polly;
using Polly.Retry;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    internal class RetryUtils
    {
        public static RetryPolicy GetRetryPolicy(ILogger logger)
        {
            return Policy
                .Handle<Exception>()
                .WaitAndRetry(200, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)), (exception, time) =>
                {
                    logger.Error(exception, "Error occured. Retrying soon...");
                });
        }
    }
}
