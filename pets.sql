USE [master]
GO
/****** Object:  Database [petApiDb]    Script Date: 5/4/2017 10:05:07 AM ******/
CREATE DATABASE [petApiDb]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [petApiDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [petApiDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [petApiDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [petApiDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [petApiDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [petApiDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [petApiDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [petApiDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [petApiDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [petApiDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [petApiDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [petApiDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [petApiDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [petApiDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [petApiDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [petApiDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [petApiDb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [petApiDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [petApiDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [petApiDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [petApiDb] SET  MULTI_USER 
GO
ALTER DATABASE [petApiDb] SET DB_CHAINING OFF 
GO
USE [petApiDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/4/2017 10:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Breeds]    Script Date: 5/4/2017 10:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breeds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImgUrl] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[PetTypeId] [int] NULL,
 CONSTRAINT [PK_Breeds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Pets]    Script Date: 5/4/2017 10:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BreedId] [int] NULL,
	[Latitude] [decimal](9, 6) NOT NULL,
	[Longitude] [decimal](9, 6) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PetTypeId] [int] NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PetTypes]    Script Date: 5/4/2017 10:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_PetTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170430174441_Initial', N'1.1.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170430175641_UpdatedDataType', N'1.1.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170502142846_precision', N'1.1.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170504164330_removedLocation', N'1.1.1')
SET IDENTITY_INSERT [dbo].[Breeds] ON 

INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (1, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_afghane.gif', N'Afghan Hound', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/American_bobtail_2.jpg/100px-American_bobtail_2.jpg', N'American Bobtail', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (3, N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/BrownVarientAsianCat.JPG/100px-BrownVarientAsianCat.JPG', N'Asian', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (4, N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/British_Longhair_-_Black_Silver_Shaded.jpg/100px-British_Longhair_-_Black_Silver_Shaded.jpg', N'British Semi-longhair', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (5, N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Britishblue.jpg/100px-Britishblue.jpg', N'British Shorthair', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (6, N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Abbaye_fev2006_003.jpg/100px-Abbaye_fev2006_003.jpg', N'Chartreux', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (7, N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/BebopsLilacPrince.JPG/100px-BebopsLilacPrince.JPG', N'Cornish Rex', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (8, N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Dragon_Li_-_Li_Hua_Mau1.jpg/100px-Dragon_Li_-_Li_Hua_Mau1.jpg', N'Dragon Li', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (9, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/German_Rex_Emi.jpg/100px-German_Rex_Emi.jpg', N'German Rex', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (10, N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Gustav_chocolate.jpg/100px-Gustav_chocolate.jpg', N'Abyssinian', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (11, N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Khao_Manee_%22ChaWee%22.jpg/100px-Khao_Manee_%22ChaWee%22.jpg', N'Khao Manee', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (12, N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Maine_Coon_female.jpg/100px-Maine_Coon_female.jpg', N'Maine Coon', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (13, N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Mekong_bobtail_female%2C_Cofein_Pride_cattery.jpg/100px-Mekong_bobtail_female%2C_Cofein_Pride_cattery.jpg', N'Mekong Bobtail', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (14, N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Minskin_Kitten_Female_blue_tabby_color-pattern.jpg/100px-Minskin_Kitten_Female_blue_tabby_color-pattern.jpg', N'Minskin', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (15, N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Oriental_shorthair_20070130_caroline.jpg/100px-Oriental_shorthair_20070130_caroline.jpg', N'Oriental Bicolor', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (16, N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Persialainen.jpg/100px-Persialainen.jpg', N'Persian (Modern Persian Cat)', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (17, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/20050922AmarilloRes.jpg/100px-20050922AmarilloRes.jpg', N'Ragamuffin', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (18, N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Russian_Blue_001.gif/100px-Russian_Blue_001.gif', N'Russian Blue', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (19, N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Savannah_Cat_portrait.jpg/100px-Savannah_Cat_portrait.jpg', N'Savannah', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (20, N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Veda%2Cchat-adulte-m%C3%A2le-race-korat.JPG/100px-Veda%2Cchat-adulte-m%C3%A2le-race-korat.JPG', N'Korat', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (21, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_yorkshire_terrier.gif', N'Yorkshire Terrier', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (22, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_west_highland_terrier.gif', N'West Highland Terrier', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (23, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_siberian_husky.gif', N'Siberian Husky', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (24, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_airdale_terrier.gif', N'Airedale Terrier', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (25, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_amstaffordshire_terrier.gif', N'American Staffordshire', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (26, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_barsoi.gif', N'Barzoi', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (27, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_basset.gif', N'Basset', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (28, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_beagle.gif', N'Beagle', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (29, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_cairn_terrier.gif', N'Cairn Terrier', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (30, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_chihuahua.gif', N'Chihuahua', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (31, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_collie.gif', N'Collie', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (32, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_dalmatiner.gif', N'Dalmatian', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (33, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_deutscher_schaeferhund.gif', N'German Shepherd', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (34, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_deutsch_langhaar.gif', N'German Longhair', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (35, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_golden_retriever.gif', N'Golden Retriever', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (36, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_greyhound_01.gif', N'Greyhound', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (37, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_irish_wolfhound.gif', N'Irish Wolfhound', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (38, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_leonberger.gif', N'Leonberger', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (39, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_mastiff.gif', N'Mastiff', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (40, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_neufundlaender.gif', N'Newfoundlander', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (41, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_scottish_terrier.gif', N'Scottish Terrier', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (42, N'https://www.hunter.de/fileadmin/_migrated/pics/img_r_shih_tzu_01.gif', N'Shih Tzu', 1)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (43, N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Raffles_singapura_cat.jpg/100px-Raffles_singapura_cat.jpg', N'Singapura', 2)
INSERT [dbo].[Breeds] ([Id], [ImgUrl], [Name], [PetTypeId]) VALUES (44, N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Sphinx2_July_2006.jpg/100px-Sphinx2_July_2006.jpg', N'Sphynx', 2)
SET IDENTITY_INSERT [dbo].[Breeds] OFF
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (1, 24, CAST(51.500000 AS Decimal(9, 6)), CAST(-0.130000 AS Decimal(9, 6)), N'Jack Bauer', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (2, 43, CAST(51.290000 AS Decimal(9, 6)), CAST(-114.010000 AS Decimal(9, 6)), N'Mufasa', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (4, 43, CAST(6.524400 AS Decimal(9, 6)), CAST(3.379200 AS Decimal(9, 6)), N'Simba', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (5, 7, CAST(43.772230 AS Decimal(9, 6)), CAST(-79.256660 AS Decimal(9, 6)), N'Nagato', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (6, 30, CAST(42.983390 AS Decimal(9, 6)), CAST(-81.233040 AS Decimal(9, 6)), N'Roronoa Zoro', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (7, 34, CAST(50.420000 AS Decimal(9, 6)), CAST(-104.650000 AS Decimal(9, 6)), N'Pein', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (8, 38, CAST(5.116350 AS Decimal(9, 6)), CAST(41.957870 AS Decimal(9, 6)), N'Cody', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (9, 8, CAST(51.050110 AS Decimal(9, 6)), CAST(-114.085290 AS Decimal(9, 6)), N'Link', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (10, 18, CAST(44.400110 AS Decimal(9, 6)), CAST(-79.666340 AS Decimal(9, 6)), N'Nami', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (11, 36, CAST(43.250110 AS Decimal(9, 6)), CAST(-79.849630 AS Decimal(9, 6)), N'Avon', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (12, 39, CAST(46.135100 AS Decimal(9, 6)), CAST(-60.183100 AS Decimal(9, 6)), N'Max', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (13, 14, CAST(42.300080 AS Decimal(9, 6)), CAST(-83.016540 AS Decimal(9, 6)), N'Shadow', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (14, 12, CAST(49.884400 AS Decimal(9, 6)), CAST(-97.147040 AS Decimal(9, 6)), N'Lucy', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (15, 9, CAST(52.116790 AS Decimal(9, 6)), CAST(-106.634520 AS Decimal(9, 6)), N'Chloe', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (16, 3, CAST(50.415206 AS Decimal(9, 6)), CAST(-104.645567 AS Decimal(9, 6)), N'Charlie', 2)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (18, 1, CAST(20.235000 AS Decimal(9, 6)), CAST(-115.222000 AS Decimal(9, 6)), N'Pushkin', 1)
INSERT [dbo].[Pets] ([Id], [BreedId], [Latitude], [Longitude], [Name], [PetTypeId]) VALUES (19, 33, CAST(50.415358 AS Decimal(9, 6)), CAST(-104.645646 AS Decimal(9, 6)), N'Lande', 1)
SET IDENTITY_INSERT [dbo].[Pets] OFF
SET IDENTITY_INSERT [dbo].[PetTypes] ON 

INSERT [dbo].[PetTypes] ([Id], [Name]) VALUES (1, N'Dog')
INSERT [dbo].[PetTypes] ([Id], [Name]) VALUES (2, N'Cat')
SET IDENTITY_INSERT [dbo].[PetTypes] OFF
/****** Object:  Index [IX_Breeds_PetTypeId]    Script Date: 5/4/2017 10:05:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Breeds_PetTypeId] ON [dbo].[Breeds]
(
	[PetTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Pets_BreedId]    Script Date: 5/4/2017 10:05:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pets_BreedId] ON [dbo].[Pets]
(
	[BreedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Pets_PetTypeId]    Script Date: 5/4/2017 10:05:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pets_PetTypeId] ON [dbo].[Pets]
(
	[PetTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[Breeds]  WITH CHECK ADD  CONSTRAINT [FK_Breeds_PetTypes_PetTypeId] FOREIGN KEY([PetTypeId])
REFERENCES [dbo].[PetTypes] ([Id])
GO
ALTER TABLE [dbo].[Breeds] CHECK CONSTRAINT [FK_Breeds_PetTypes_PetTypeId]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Breeds_BreedId] FOREIGN KEY([BreedId])
REFERENCES [dbo].[Breeds] ([Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Breeds_BreedId]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_PetTypes_PetTypeId] FOREIGN KEY([PetTypeId])
REFERENCES [dbo].[PetTypes] ([Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_PetTypes_PetTypeId]
GO
USE [master]
GO
ALTER DATABASE [petApiDb] SET  READ_WRITE 
GO
