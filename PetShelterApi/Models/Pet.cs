using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetShelterApi.Models
{
    public class Pet{
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        [ForeignKey("PetTypeId")]
        public PetType Type { get; set; }
        public int? PetTypeId { get; set; }
        [ForeignKey("BreedId")]
        public Breed Breed { get; set; }
        public int? BreedId { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public string Location { get; set; }
    }
}