using BDEnergyFramework.Models;

namespace BDEnergyFramework.Services.Repositories
{
    public interface IMeasurementRepository
    {
        void InsertMeasurements(List<MeasurementContext> measurements);
    }
}