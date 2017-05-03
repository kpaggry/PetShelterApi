using System.Collections.Generic;
using System.Threading.Tasks;
using PetShelterApi.Models.ViewModels;

namespace PetShelterApi.Models
{
    public interface IPetRepository
    {
        Task<List<Pet>> GetPets();
        Task<Pet> GetPet(int petId);
        Task<bool> CreatePet(PetVm pet);
        Task<List<PetType>> GetPetTypes();
        Task<int> CountPets();
        Task<IEnumerable<Pet>> GetPetPerPage(int pageNumber, int pageSize);
        Task<bool> ConfirmUniqueName(string petName, int breedId);
    }
}
