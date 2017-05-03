using System.ComponentModel.DataAnnotations;

namespace PetShelterApi.Models.ViewModels
{
    public class PetVm
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public PetType Type { get; set; }
        public Breed Breed { get; set; }
        [Required]
        public decimal Latitude { get; set; }
        [Required]
        public decimal Longitude { get; set; }
        public string Location { get; set; }
        public int? PetTypeId { get; set; }
        public int? BreedId { get; set; }
    }
}
