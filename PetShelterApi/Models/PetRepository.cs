using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using PetShelterApi.Models.ViewModels;

namespace PetShelterApi.Models
{
    public class PetRepository : IPetRepository
    {
        readonly PetContext _repo;
        public PetRepository(PetContext repo)
        {
            _repo = repo;
        }

        public async Task<bool> ConfirmUniqueName(string petName, int breedId)
        {
            return await _repo.Pets.Where(x => x.Name == petName && x.BreedId == breedId).CountAsync() <= 0;
        }

        public async Task<int> CountPets()
        {
            return await _repo.Pets.CountAsync();
        }

        public async Task<bool> CreatePet(PetVm pet)
        {
            var newPet = new Pet
            {
                Name = pet.Name,
                Latitude = pet.Latitude,
                Location = pet.Location,
                Longitude = pet.Longitude,
                BreedId = pet.Breed.Id,
                PetTypeId = pet.Type.Id
            };

            _repo.Pets.Add(newPet);
            return await _repo.SaveChangesAsync() > 0;
        }

        public async Task<Pet> GetPet(int petId)
        {
            return await _repo.Pets.Include(x => x.Breed).FirstOrDefaultAsync(x => x.Id == petId);
        }

        public async Task<IEnumerable<Pet>> GetPetPerPage(int pageNumber, int pageSize)
        {
            return await _repo.Pets
                            .Include(x => x.Breed)
                            .Include(x => x.Type)
                            .Skip((pageNumber -1) * pageSize)
                            .Take(pageSize)
                            .OrderBy(x => x.Name)
                            .Select(x => new Pet
                            {
                                Id = x.Id,
                                Name = x.Name,
                                Latitude = x.Latitude,
                                Longitude = x.Longitude,
                                Breed = new Breed
                                {
                                    ImgUrl = x.Breed.ImgUrl,
                                    Name = x.Breed.Name,
                                    Id = x.Breed.Id
                                },
                                Type = new PetType
                                {
                                    Id = x.Type.Id,
                                    Name = x.Type.Name
                                },
                                Location = x.Location
                            })
                            .ToListAsync();
        }

        public async Task<List<Pet>> GetPets()
        {
            return await _repo.Pets
                            .Include(x => x.Breed)
                            .Include(x => x.Type)
                            .OrderByDescending(x => x.Name)
                            .Select(x => new Pet
                            {
                                Id = x.Id,
                                Name = x.Name,
                                Latitude = x.Latitude,
                                Longitude = x.Longitude,
                                Breed = new Breed
                                {
                                    ImgUrl = x.Breed.ImgUrl,
                                    Name = x.Breed.Name,
                                    Id = x.Breed.Id
                                },
                                Type = new PetType
                                {
                                    Id = x.Type.Id,
                                    Name = x.Type.Name
                                },
                                Location = x.Location
                            })
                            .ToListAsync();
        }

        public async Task<List<PetType>> GetPetTypes()
        {
            return await _repo.PetTypes.Include(x => x.Breeds).ToListAsync();
        }

    }
}
