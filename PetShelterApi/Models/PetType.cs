using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PetShelterApi.Models
{
    public class PetType{
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Breed> Breeds { get; set; }
    }
}