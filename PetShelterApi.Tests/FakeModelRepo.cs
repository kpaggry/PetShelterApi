using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PetShelterApi.Models;
using PetShelterApi.Models.ViewModels;

namespace PetShelterApi.Tests
{
    public class FakeModelRepo : IPetRepository
    {
        public List<Pet> Pets { get; set; } = new List<Pet>
        {
            new Pet
            {
                Id = 1,
                Name = "Seyi",
                Latitude = 50.123M,
                Longitude = -112.3553M,
                Breed = new Breed { ImgUrl = "//src/img", Name = "terrier", Id = 2 },
                Type = new PetType { Id = 1, Name = "Dog" },
                Location = "Regina, SK"
            },
            new Pet
            {
                Id = 2,
                Name = "Pushkin",
                Latitude = 50.123M,
                Longitude = -112.3553M,
                Breed = new Breed { ImgUrl = "//src/img", Name = "terrier", Id = 2 },
                Type = new PetType { Id = 1, Name = "Dog" },
                Location = "Regina, SK"
            }
        };

        public  List<PetType> PetTypes { get; set; } = new List<PetType>
        {
            new PetType { Id = 1, Name = "Dog", Breeds = new List<Breed>
            {
                new Breed { ImgUrl = "//src/img", Name = "terrier", Id = 1 },
                new Breed { ImgUrl = "//src/img", Name = "Pug", Id = 2 },
                new Breed { ImgUrl = "//src/img", Name = "Chiwawa", Id = 3 }
            }},
            new PetType { Id = 2, Name = "Cat", Breeds = new List<Breed>
            {
                new Breed { ImgUrl = "//src/img", Name = "asian", Id = 4 },
                new Breed { ImgUrl = "//src/img", Name = "type", Id = 5 },
                new Breed { ImgUrl = "//src/img", Name = "british", Id = 6 }
            }}
        };

        public async Task<bool> ConfirmUniqueName(string petName, int breedId)
        {
            await Task.Delay(1000);
            return Pets.Count(x => x.Name == petName && x.BreedId == breedId) <= 0;
        }

        public async Task<int> CountPets()
        {
            await Task.Delay(1000);
            return Pets.Count();
        }

        public async Task<bool> CreatePet(PetVm pet)
        {
            await Task.Delay(1000);
            var newPet = new Pet
            {
                Name = pet.Name,
                Latitude = pet.Latitude,
                Location = pet.Location,
                Longitude = pet.Longitude,
                BreedId = pet.Breed.Id,
                PetTypeId = pet.Type.Id
            };

            Pets.Add(newPet);
            return true;
        }

        public async Task<Pet> GetPet(int petId)
        {
            await Task.Delay(1000);
            return Pets.FirstOrDefault(x => x.Id == petId);
        }

        public async Task<IEnumerable<Pet>> GetPetPerPage(int pageNumber, int pageSize)
        {
            await Task.Delay(1000);
            return Pets.Skip((pageNumber - 1) * pageSize)
                .Take(pageSize).OrderBy(x => x.Name).ToList();
        }

        public async Task<List<Pet>> GetPets()
        {
            await Task.Delay(1000);
            return Pets.ToList();
        }

        public async Task<List<PetType>> GetPetTypes()
        {
            await Task.Delay(1000);
            return PetTypes.ToList();
        }
    }
}
