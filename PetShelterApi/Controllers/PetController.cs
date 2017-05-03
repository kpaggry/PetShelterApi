using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PetShelterApi.Models;
using PetShelterApi.Models.ViewModels;
using PetShelterApi.Infrastructure.Filters;
using PetShelterApi.Infrastructure.Logging;

namespace PetShelterApi.Controllers
{
    [Route("api/[controller]")]
    public class PetController : Controller
    {
        private readonly IPetRepository _repo;
        private readonly ILogger _log;

        public PetController(IPetRepository repo, ILogger log)
        {
            _repo = repo;
            _log = log;
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> GetPets()
        {
            try
            {
                return Ok(await _repo.GetPets());
            }
            catch (Exception ex)
            {
                _log.LogException(ex);
                return BadRequest(new { status = "failed", message = "An error has occured. Kindly check back again" });
            }
        }

        [HttpGet]
        [Route("[action]/{pageNumber:int}")]
        public async Task<IActionResult> GetPetsPerPage(int pageNumber)
        {
            try
            {
                var totalCount = await _repo.CountPets();
                var totalPages = Math.Ceiling((double)totalCount / 10);
                return Ok(new { totalCount, totalPages, pets = await _repo.GetPetPerPage(pageNumber, 10)});
            }
            catch (Exception ex)
            {
                _log.LogException(ex);
                return BadRequest(new { status = "failed", message = "An error has occured. Kindly check back again" });
            }
        }

        [HttpGet]
        [Route("[action]/{id}")]
        public async Task<IActionResult> GetPet(int id)
        {
            try
            {
                var pet = await _repo.GetPet(id);
                if (pet == null) return NotFound("Sorry, there is no Pet with this ID");
                return Ok(pet);
            }
            catch (Exception ex)
            {
                _log.LogException(ex);
                return BadRequest(new { status = "failed", message = "An error has occured. Kindly check back again" });
            }
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> GetPetTypes()
        {
            try
            {
                return Ok(await _repo.GetPetTypes());
            }
            catch (Exception ex)
            {
                _log.LogException(ex);
                return BadRequest(new { status = "failed", message = "An error has occured. Kindly check back again" });
            }
        }

        [HttpPost]
        [Route("[action]")]
        [ValidateModel]
        public async Task<IActionResult> CreatePet([FromBody]PetVm pet)
        {
            try
            {
                var unique = await _repo.ConfirmUniqueName(pet.Name, pet.Breed.Id);
                if (!unique) return Ok(new { status = "exists", message = $"{pet.Name} already exists on the {pet.Breed.Name} type. Choose another name" });
                if (await _repo.CreatePet(pet)) return Created("", new { status = "success", message = "Pet Created Successfully!" });
                return Ok(new { status = "failed", message = "Could not create Pet" });
            }
            catch (Exception ex)
            {
                _log.LogException(ex);
                return BadRequest(new { status = "failed", message = "An error has occured. Kindly check back again" });
            }
        }
    }
}