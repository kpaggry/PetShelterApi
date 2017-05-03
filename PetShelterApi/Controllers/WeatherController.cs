using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PetShelterApi.Models;
using PetShelterApi.Infrastructure.Logging;

namespace PetShelterApi.Controllers
{
    [Route("api/[controller]")]
    public class WeatherController : Controller
    {
        readonly IWeatherInspector _weather;
        private readonly ILogger _log;

        public WeatherController(IWeatherInspector weather, ILogger log)
        {
            _weather = weather;
            _log = log;
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> ConfirmRain(string lat, string lon)
        {
            try
            {
                var x = await _weather.CheckForRain(lat, lon);
                return Ok(x);
            }
            catch(Exception ex)
            {
                _log.LogException(ex);
                return BadRequest("Something went wrong");
            }
        }
    }
}