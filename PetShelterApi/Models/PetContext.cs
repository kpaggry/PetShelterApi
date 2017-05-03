using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PetShelterApi.Infrastructure.Maps;

namespace PetShelterApi.Models
{
    public class PetContext : DbContext{
        public PetContext(DbContextOptions<PetContext> options) : base(options)
		{
		}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            new PetMap(modelBuilder.Entity<Pet>());
        }

        public DbSet<PetType> PetTypes { get; set; }
        public DbSet<Breed> Breeds { get; set; }
        public DbSet<Pet> Pets { get; set; }
    }
}