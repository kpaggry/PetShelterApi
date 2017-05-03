using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PetShelterApi.Controllers;
using Xunit;
using Moq;
using PetShelterApi.Models;
using Newtonsoft.Json;
using PetShelterApi.Infrastructure.Logging;
using PetShelterApi.Models.ViewModels;

namespace PetShelterApi.Tests
{
    public class PetControllerTests
    {
        [Fact]
        public async Task GetPetsReturnsAllPets()
        {
            var repoMock = new Mock<IPetRepository>();
            var logger = new Mock<ILogger>();
            logger.Setup(x => x.Path).Returns("sample");
            repoMock.Setup(x => x.GetPets()).Returns(new FakeModelRepo().GetPets());
            var controller = new PetController(repoMock.Object, logger.Object);

            var result = await controller.GetPets() as OkObjectResult;

            if (result != null) Assert.IsType<List<Pet>>(result.Value);
        }

        [Fact]
        public async Task GetPetReturnsAPet()
        {
            var repoMock = new Mock<IPetRepository>();
            var logger = new Mock<ILogger>();
            logger.Setup(x => x.Path).Returns("sample");
            repoMock.Setup(x => x.GetPet(1)).Returns(new FakeModelRepo().GetPet(1));
            var controller = new PetController(repoMock.Object, logger.Object);

            dynamic result = await controller.GetPet(1) as OkObjectResult;
            dynamic notFound = await controller.GetPet(3) as NotFoundObjectResult;

            if (result != null) Assert.Equal<int>(1, result.Value.Id);
            if (notFound != null) Assert.Equal("Sorry, there is no Pet with this ID", notFound.Value);
        }

        [Fact]
        public async Task GetPetPerPageReturnsPerPage()
        {
            var repo = new FakeModelRepo();
            var repoMock = new Mock<IPetRepository>();
            var logger = new Mock<ILogger>();
            logger.Setup(x => x.Path).Returns("sample");
            repoMock.Setup(x => x.CountPets()).Returns(repo.CountPets());
            repoMock.Setup(x => x.GetPetPerPage(1, 10)).Returns(repo.GetPetPerPage(1, 10));
            var controller = new PetController(repoMock.Object, logger.Object);

            var result = await controller.GetPetsPerPage(1) as OkObjectResult;
            if (result != null)
            {
                dynamic obj = new DynamicObjectResultValue(result.Value);


                Assert.Equal(2, obj.totalCount);
                Assert.Equal(1, obj.totalPages);
                Assert.IsType<List<Pet>>(obj.pets);
            }
        }

        [Fact]
        public async Task GetPetTypesReturnsAllPetsTypes()
        {
            var repoMock = new Mock<IPetRepository>();
            var logger = new Mock<ILogger>();
            logger.Setup(x => x.Path).Returns("sample");
            repoMock.Setup(x => x.GetPetTypes()).Returns(new FakeModelRepo().GetPetTypes());
            var controller = new PetController(repoMock.Object, logger.Object);

            var result = await controller.GetPetTypes() as OkObjectResult;

            if (result != null) Assert.IsType<List<PetType>>(result.Value);
        }

        [Fact]
        public async Task CreatePetReturnsMessage()
        {
            var newPet = new PetVm
            {
                Name = "Keffas",
                Latitude = 50.123M,
                Longitude = -112.3553M,
                Breed = new Breed { ImgUrl = "//src/img", Name = "terrier", Id = 2 },
                Type = new PetType { Id = 1, Name = "Dog" },
                Location = "Regina, SK"
            };

            var repo = new FakeModelRepo();
            var repoMock = new Mock<IPetRepository>();
            var logger = new Mock<ILogger>();
            logger.Setup(x => x.Path).Returns("sample");
            repoMock.Setup(x => x.ConfirmUniqueName(newPet.Name, newPet.Breed.Id)).Returns(repo.ConfirmUniqueName(newPet.Name, newPet.Breed.Id));
            repoMock.Setup(x => x.CreatePet(newPet)).Returns(repo.CreatePet(newPet));
            var controller = new PetController(repoMock.Object, logger.Object);

            var result = await controller.CreatePet(newPet) as CreatedResult;
            newPet.Name = "Seyi";
            var exists = await controller.CreatePet(newPet) as OkObjectResult;

            if (result != null)
            {
                var obj = JsonConvert.DeserializeObject<Result>(JsonConvert.SerializeObject(result.Value));
                Assert.Equal("success", obj.Status);
            }

            if (exists != null)
            {
                var existsObj = JsonConvert.DeserializeObject<Result>(JsonConvert.SerializeObject(exists.Value));
                Assert.Equal("exists", existsObj.Status);
            }
        }
    }

    public class Result
    {
        public string Status { get; set; }
        public string Message { get; set; }
    }
}
