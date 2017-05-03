using System.Threading.Tasks;
using System.Net.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using PetShelterApi.Models.ViewModels;

namespace PetShelterApi.Models
{
    public class WeatherInspector : IWeatherInspector
    {
        readonly IConfigurationRoot _config;

        public WeatherInspector(IConfigurationRoot config)
        {
            _config = config;
        }

        public async Task<bool> CheckForRain(string latitude, string longitude)
        {
            var url = $"{_config["Apis:forecastIO"]}{_config["Keys:forecastIO"]}/{latitude},{longitude}";
            using (var client = new HttpClient())
            using (var response = await client.GetAsync(url))
            using (var content = response.Content)
            {
                var res = JsonConvert.DeserializeObject<WeatherStatus>(await content.ReadAsStringAsync());
                return res.Currently.Summary.ToUpperInvariant().Contains("RAIN");
            }
        }
    }
}
