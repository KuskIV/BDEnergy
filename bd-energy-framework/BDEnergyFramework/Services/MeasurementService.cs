using System.Data.Common;

namespace BDEnergyFramework.Services
{
    public class MeasurementService : IMeasurementService
    {
        private readonly IDutService _dutService;
        private readonly Func<DbConnection> _dbFactory;

        public MeasurementService(IDutService dutService, Func<DbConnection> dbFactory)
        {
            _dutService = dutService;
            _dbFactory = dbFactory;
        }

    }
}
