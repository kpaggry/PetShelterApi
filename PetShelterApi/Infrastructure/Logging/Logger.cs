using System;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace PetShelterApi.Infrastructure.Logging
{
    public class Logger : ILogger
    {
        readonly IHostingEnvironment _env;
        public Logger(IHostingEnvironment env)
        {
            _env = env;
        }

        public string Path { get; set; }

        public void LogException(Exception ex)
        {
            Path = _env.ContentRootPath;
            File.AppendAllText($"{Path}/Logs/log.txt", ex.ToString());
        }
    }
}
