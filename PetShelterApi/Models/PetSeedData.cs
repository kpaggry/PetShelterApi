using System.Collections.Generic;
using Newtonsoft.Json;
using System.IO;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using System.Linq;
using Microsoft.AspNetCore.Hosting;
using System;

namespace PetShelterApi.Models
{
    public static class PetSeedData{
        public static void Populate(IApplicationBuilder app, IHostingEnvironment env){
            PetContext _ctx = app.ApplicationServices.GetRequiredService<PetContext>();

            if(!_ctx.PetTypes.Any()){
                _ctx.PetTypes.AddRange(
                    new PetType{
                        Name = "Dog",
                        Breeds = GetBreeds<Breed>("dogs.json", env)
                    },
                    new PetType{
                        Name = "Cat",
                        Breeds = GetBreeds<Breed>("cats.json", env)
                    }
                );
                _ctx.SaveChanges();
            }
        }

        public static ICollection<T> GetBreeds<T>(string filename, IHostingEnvironment env){
            var contentRoot = env.ContentRootPath;
            var file = File.ReadAllText(contentRoot + "/Data/" + filename);
            return JsonConvert.DeserializeObject<ICollection<T>>(file);
        }

        public static int GetRandomBreed(int max){
            var rand = new Random();
            return rand.Next(0, max);
        }
    }
}