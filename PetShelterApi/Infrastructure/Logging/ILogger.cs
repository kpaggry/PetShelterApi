using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetShelterApi.Infrastructure.Logging
{
    public interface ILogger
    {
        void LogException(Exception ex);
        string Path { get; set; }
    }
}
