using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PetShelterApi.Models.ViewModels
{
    public class PetTypeVm
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<Breed> Breeds { get; set; }
    }
}
