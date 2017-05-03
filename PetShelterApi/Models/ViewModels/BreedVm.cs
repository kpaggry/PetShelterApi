using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PetShelterApi.Models.ViewModels
{
    public class BreedVm
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImgUrl { get; set; }
    }
}
