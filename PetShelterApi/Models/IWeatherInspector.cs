using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PetShelterApi.Models
{
    public interface IWeatherInspector
    {
        Task<bool> CheckForRain(string latitude, string longitude);
    }
}
