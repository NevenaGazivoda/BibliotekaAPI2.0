USE [master]
GO
/****** Object:  Database [Biblioteka]    Script Date: 6/3/2021 7:23:14 PM ******/
CREATE DATABASE [Biblioteka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Biblioteka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Biblioteka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Biblioteka] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biblioteka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteka] SET RECOVERY FULL 
GO
ALTER DATABASE [Biblioteka] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteka] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Biblioteka', N'ON'
GO
ALTER DATABASE [Biblioteka] SET QUERY_STORE = OFF
GO
USE [Biblioteka]
GO
/****** Object:  Table [dbo].[Clanovi]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clanovi](
	[PKClanID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](255) NOT NULL,
	[Prezime] [varchar](255) NOT NULL,
	[GodRodjenja] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKClanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Knjige]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Knjige](
	[PKKnjigaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NOT NULL,
	[GodIzdanja] [int] NULL,
	[FKPisacID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKKnjigaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pisci]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pisci](
	[PKPisacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](255) NOT NULL,
	[Prezime] [varchar](255) NULL,
	[GodRodjenja] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKPisacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posudjivanje]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posudjivanje](
	[FKClanID] [int] NULL,
	[FKKnjigaID] [int] NULL,
	[DatumUzimanja] [date] NULL,
	[DatumVracanja] [date] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clanovi] ON 

INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (1, N'Petar', N'Savic', 1975)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (2, N'Jovan', N'Maric', 1950)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (3, N'Marija', N'Jovanovic', 1990)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (4, N'Jakov', N'Jovanovic', 1995)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (5, N'Sanja', N'Savic', 1986)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (6, N'Maja', N'Milosevic', 1987)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (7, N'Sonja', N'Lukic', 1999)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (8, N'Igor', N'Ivanic', 1978)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (9, N'Milan', N'Milanovic', 1987)
INSERT [dbo].[Clanovi] ([PKClanID], [Ime], [Prezime], [GodRodjenja]) VALUES (15, N'Mirko', N'Mirkovic', 1989)
SET IDENTITY_INSERT [dbo].[Clanovi] OFF
GO
SET IDENTITY_INSERT [dbo].[Knjige] ON 

INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (1, N'Vera Pavladoljska', 1962, 6)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (2, N'Travnicka hronika', 1945, 1)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (3, N'Na Drini cuprija', 1945, 1)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (4, N'Una', 1981, 4)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (5, N'Sanja', 2003, 4)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (6, N'Rani jadi', 1970, 5)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (7, N'Seobe', 1929, 2)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (8, N'Magarece godine', 1960, 3)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (9, N'Dnevnik o Carnojevicu', 1921, 2)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (10, N'Basta sljezove boje', 1970, 3)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (11, N'Seobe 2', 1970, 2)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (12, N'Tvrdjava', 1970, 7)
INSERT [dbo].[Knjige] ([PKKnjigaID], [Naziv], [GodIzdanja], [FKPisacID]) VALUES (13, N'Prokleta avlija', 1954, 1)
SET IDENTITY_INSERT [dbo].[Knjige] OFF
GO
SET IDENTITY_INSERT [dbo].[Pisci] ON 

INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (1, N'Ivo', N'Andric', 1892)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (2, N'Milos', N'Crnjanski', 1893)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (3, N'Branko', N'Copic', 1915)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (4, N'Momo', N'Kapor', 1937)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (5, N'Danilo', N'Kis', 1935)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (6, N'Matija', N'Beckovic', 1939)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (7, N'Mesa', N'Selimovic', 1910)
INSERT [dbo].[Pisci] ([PKPisacID], [Ime], [Prezime], [GodRodjenja]) VALUES (10, N'Isidora', N'Sekulic', 1900)
SET IDENTITY_INSERT [dbo].[Pisci] OFF
GO
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (5, 1, CAST(N'2021-01-05' AS Date), CAST(N'2021-02-02' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (1, 7, CAST(N'2021-04-05' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (3, 2, CAST(N'2021-04-10' AS Date), CAST(N'2021-04-15' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (7, 9, CAST(N'2021-03-09' AS Date), CAST(N'2021-03-20' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (2, 6, CAST(N'2021-03-29' AS Date), CAST(N'2021-04-10' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (8, 8, CAST(N'2021-04-09' AS Date), CAST(N'2021-04-15' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (4, 5, CAST(N'2021-03-09' AS Date), CAST(N'2021-03-20' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (5, 4, CAST(N'2021-04-09' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (9, 3, CAST(N'2021-04-01' AS Date), CAST(N'2021-04-10' AS Date))
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (2, 5, CAST(N'2021-05-16' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (7, 3, CAST(N'2021-05-16' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (15, 12, CAST(N'2021-06-01' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (8, 2, CAST(N'2021-06-03' AS Date), NULL)
INSERT [dbo].[Posudjivanje] ([FKClanID], [FKKnjigaID], [DatumUzimanja], [DatumVracanja]) VALUES (1, 5, CAST(N'2021-06-03' AS Date), NULL)
GO
ALTER TABLE [dbo].[Knjige]  WITH CHECK ADD FOREIGN KEY([FKPisacID])
REFERENCES [dbo].[Pisci] ([PKPisacID])
GO
/****** Object:  StoredProcedure [dbo].[deleteClanovi]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteClanovi]
@IdClana int
AS
BEGIN
Delete from Clanovi where PKClanID=@IdClana

END
GO
/****** Object:  StoredProcedure [dbo].[deletePisci]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePisci]
@IdPisca int
AS
BEGIN
Delete from Pisci where PKPisacID=@IdPisca

END
GO
/****** Object:  StoredProcedure [dbo].[getAllFromClanovi]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllFromClanovi] 

AS
BEGIN
SELECT * from Clanovi
END
GO
/****** Object:  StoredProcedure [dbo].[getAllFromKnjige]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllFromKnjige] 

AS
BEGIN
Select k.PKKnjigaID, k.Naziv, p.Ime, p.Prezime 
from knjige as k 
join Pisci as p 
on k.FKPisacID = p.PKPisacID

END
GO
/****** Object:  StoredProcedure [dbo].[getAllFromPisci]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllFromPisci] 
AS
BEGIN
	
	SELECT * from Pisci

END
GO
/****** Object:  StoredProcedure [dbo].[getAllFromPosudjivanje]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllFromPosudjivanje]

AS
BEGIN
select Clanovi.Ime, Clanovi.Prezime, Knjige.Naziv, Posudjivanje.DatumUzimanja, Posudjivanje.DatumVracanja 
from Posudjivanje 
join Clanovi 
on Posudjivanje.FKClanID = Clanovi.PKClanID 
join Knjige 
on Posudjivanje.FKKnjigaID = Knjige.PKKnjigaID


END
GO
/****** Object:  StoredProcedure [dbo].[getClanById]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getClanById] 
@ClanId int
AS
BEGIN
SELECT * from Clanovi where PKClanID=@ClanId
END
GO
/****** Object:  StoredProcedure [dbo].[getPisacById]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getPisacById]
@PisacId int
AS
BEGIN
	SELECT * from Pisci where PKPisacID=@PisacId

END
GO
/****** Object:  StoredProcedure [dbo].[postClanovi]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[postClanovi] 
(
@Ime varchar(255),
@Prezime varchar(255),
@Godina int
)
AS
BEGIN
INSERT INTO dbo.Clanovi (Ime, Prezime, GodRodjenja) 
VALUES (@Ime, @Prezime, @Godina);

END
GO
/****** Object:  StoredProcedure [dbo].[postKnjige]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[postKnjige]
@Naziv varchar(255),
@Godina int,
@FKPisca int
AS
BEGIN
INSERT INTO dbo.Knjige([Naziv] ,[GodIzdanja] ,[FKPisacID]) 
VALUES (@Naziv, @Godina, @FKPisca);

END
GO
/****** Object:  StoredProcedure [dbo].[postPisci]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[postPisci] (
@Ime varchar(255),
@Prezime varchar(255),
@Godina int
)
AS
BEGIN
INSERT INTO dbo.Pisci(Ime, Prezime, GodRodjenja) 
VALUES (@Ime, @Prezime, @Godina);

END
GO
/****** Object:  StoredProcedure [dbo].[postPosudjivanje]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[postPosudjivanje]
@FKClana int,
@FKKnjige int,
@Datum date

AS
BEGIN
INSERT INTO dbo.Posudjivanje(FKClanID, FKKnjigaID, DatumUzimanja) 
VALUES (@FKClana, @FKKnjige, @Datum);

END
GO
/****** Object:  StoredProcedure [dbo].[updatePisci]    Script Date: 6/3/2021 7:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePisci] 
(
@Ime varchar(255),
@Prezime varchar(255),
@Godina int,
@PisacId int
)
AS
BEGIN
UPDATE Pisci 
SET [Ime] = @Ime,
[Prezime] = @Prezime,
[GodRodjenja]= @Godina
WHERE PKPisacID=@PisacId
END
GO
USE [master]
GO
ALTER DATABASE [Biblioteka] SET  READ_WRITE 
GO
