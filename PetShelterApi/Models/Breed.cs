using System;
using System.ComponentModel.DataAnnotations;

namespace PetShelterApi.Models
{
    public class Breed{
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImgUrl { get; set; }
    }
}