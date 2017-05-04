using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using PetShelterApi.Models;

namespace PetShelterApi.Migrations
{
    [DbContext(typeof(PetContext))]
    [Migration("20170504164330_removedLocation")]
    partial class removedLocation
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
            modelBuilder
                .HasAnnotation("ProductVersion", "1.1.1")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("PetShelterApi.Models.Breed", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ImgUrl");

                    b.Property<string>("Name");

                    b.Property<int?>("PetTypeId");

                    b.HasKey("Id");

                    b.HasIndex("PetTypeId");

                    b.ToTable("Breeds");
                });

            modelBuilder.Entity("PetShelterApi.Models.Pet", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("BreedId");

                    b.Property<decimal>("Latitude")
                        .HasColumnType("decimal(9,6)");

                    b.Property<decimal>("Longitude")
                        .HasColumnType("decimal(9,6)");

                    b.Property<string>("Name");

                    b.Property<int?>("PetTypeId");

                    b.HasKey("Id");

                    b.HasIndex("BreedId");

                    b.HasIndex("PetTypeId");

                    b.ToTable("Pets");
                });

            modelBuilder.Entity("PetShelterApi.Models.PetType", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Name");

                    b.HasKey("Id");

                    b.ToTable("PetTypes");
                });

            modelBuilder.Entity("PetShelterApi.Models.Breed", b =>
                {
                    b.HasOne("PetShelterApi.Models.PetType")
                        .WithMany("Breeds")
                        .HasForeignKey("PetTypeId");
                });

            modelBuilder.Entity("PetShelterApi.Models.Pet", b =>
                {
                    b.HasOne("PetShelterApi.Models.Breed", "Breed")
                        .WithMany()
                        .HasForeignKey("BreedId");

                    b.HasOne("PetShelterApi.Models.PetType", "Type")
                        .WithMany()
                        .HasForeignKey("PetTypeId");
                });
        }
    }
}
