using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PetShelterApi.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace PetShelterApi.Infrastructure.Maps
{
    public class PetMap
    {
        public PetMap(EntityTypeBuilder<Pet> entityBuilder)
        {
            entityBuilder.HasKey(r => r.Id);

            //Using the column type extension
            entityBuilder.Property(r => r.Latitude)
                .HasColumnType("decimal(9,6)");

            entityBuilder.Property(r => r.Longitude)
                .HasColumnType("decimal(9,6)");
        }
    }
}
