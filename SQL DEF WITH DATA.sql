USE [master]
GO
/****** Object:  Database [RoosterDB]    Script Date: 5-11-2018 18:21:23 ******/
CREATE DATABASE [RoosterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RoosterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RoosterDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RoosterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RoosterDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RoosterDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RoosterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RoosterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RoosterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RoosterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RoosterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RoosterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RoosterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RoosterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RoosterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RoosterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RoosterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RoosterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RoosterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RoosterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RoosterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RoosterDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RoosterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RoosterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RoosterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RoosterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RoosterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RoosterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RoosterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RoosterDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RoosterDB] SET  MULTI_USER 
GO
ALTER DATABASE [RoosterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RoosterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RoosterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RoosterDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RoosterDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RoosterDB] SET QUERY_STORE = OFF
GO
USE [RoosterDB]
GO
/****** Object:  Table [dbo].[Authenticator]    Script Date: 5-11-2018 18:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authenticator](
	[AuthenticatorId] [int] IDENTITY(1,1) NOT NULL,
	[Persoon_Id] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Authenticator] PRIMARY KEY CLUSTERED 
(
	[AuthenticatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LokaalType]    Script Date: 5-11-2018 18:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LokaalType](
	[LokaalTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LokaalTypeNaam] [varchar](45) NULL,
 CONSTRAINT [PK_LokaalType] PRIMARY KEY CLUSTERED 
(
	[LokaalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persoon]    Script Date: 5-11-2018 18:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persoon](
	[PersoonId] [int] IDENTITY(1,1) NOT NULL,
	[PersoonVoornaam] [varchar](15) NULL,
	[PersoonAchternaam] [varchar](15) NULL,
	[PersoonTelefoonnummer] [int] NULL,
	[PersoonEmail] [nvarchar](30) NULL,
	[PersoonStraat] [varchar](30) NULL,
	[PersoonHuisnummer] [int] NULL,
	[PersoonToevoegingHuisnr] [varchar](1) NULL,
	[PersoonWoonplaats] [varchar](15) NULL,
	[PersoonPostcode] [varchar](6) NULL,
	[PersoonGebruikersnaam] [varchar](30) NULL,
	[PersoonWachtwoord] [nvarchar](30) NULL,
	[PersoonFunctie] [varchar](20) NULL,
	[PersoonContractUren] [int] NULL,
 CONSTRAINT [PK_Persoon] PRIMARY KEY CLUSTERED 
(
	[PersoonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersoonUren]    Script Date: 5-11-2018 18:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersoonUren](
	[UrenBeschikbaarheid_Id] [int] NULL,
	[Persoon_Id] [int] NULL,
	[PersoonUren_Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PersoonUren] PRIMARY KEY CLUSTERED 
(
	[PersoonUren_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersoonVak]    Script Date: 5-11-2018 18:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersoonVak](
	[Persoon_Id] [int] NULL,
	[Vak_Id] [int] NULL,
	[PersoonVak_Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PersoonVak] PRIMARY KEY CLUSTERED 
(
	[PersoonVak_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrenBeschikbaarheid]    Script Date: 5-11-2018 18:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrenBeschikbaarheid](
	[UrenBeschikbaarheidId] [int] IDENTITY(1,1) NOT NULL,
	[TijdstipBeschikbaarheid] [datetime] NULL,
	[DagBeschikbaarheid] [varchar](10) NULL,
 CONSTRAINT [PK_UrenBeschikbaarheid] PRIMARY KEY CLUSTERED 
(
	[UrenBeschikbaarheidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrenCollege]    Script Date: 5-11-2018 18:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrenCollege](
	[UrenCollegeId] [int] IDENTITY(1,1) NOT NULL,
	[CollegeNaam] [varchar](50) NULL,
 CONSTRAINT [PK_UrenCollege] PRIMARY KEY CLUSTERED 
(
	[UrenCollegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vak]    Script Date: 5-11-2018 18:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vak](
	[VakId] [int] IDENTITY(1,1) NOT NULL,
	[VakNaam] [varchar](30) NULL,
	[VakCode] [nchar](10) NULL,
 CONSTRAINT [PK_Vak] PRIMARY KEY CLUSTERED 
(
	[VakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VakLokaalType]    Script Date: 5-11-2018 18:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VakLokaalType](
	[LokaalType_Id] [int] NULL,
	[Vak_Id] [int] NULL,
	[VakLokaalType_Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VakLokaalType] PRIMARY KEY CLUSTERED 
(
	[VakLokaalType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VakUrenCollege]    Script Date: 5-11-2018 18:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VakUrenCollege](
	[Vak_Id] [int] NULL,
	[UrenCollege_Id] [int] NULL,
	[Vakduur] [float] NULL,
	[VakUrenCollege_Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VakUrenCollege] PRIMARY KEY CLUSTERED 
(
	[VakUrenCollege_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LokaalType] ON 

INSERT [dbo].[LokaalType] ([LokaalTypeId], [LokaalTypeNaam]) VALUES (1, N'Collegezaal')
INSERT [dbo].[LokaalType] ([LokaalTypeId], [LokaalTypeNaam]) VALUES (2, N'Practicumlokaal')
INSERT [dbo].[LokaalType] ([LokaalTypeId], [LokaalTypeNaam]) VALUES (3, N'Leslokaal')
SET IDENTITY_INSERT [dbo].[LokaalType] OFF
SET IDENTITY_INSERT [dbo].[Persoon] ON 

INSERT [dbo].[Persoon] ([PersoonId], [PersoonVoornaam], [PersoonAchternaam], [PersoonTelefoonnummer], [PersoonEmail], [PersoonStraat], [PersoonHuisnummer], [PersoonToevoegingHuisnr], [PersoonWoonplaats], [PersoonPostcode], [PersoonGebruikersnaam], [PersoonWachtwoord], [PersoonFunctie], [PersoonContractUren]) VALUES (3, N'Mitchell', N'Bink', 648977453, N'1331221bink@zuyd.nl', N'Karel van den Oeverstraat', 40, NULL, N'Heerlen', N'6416TG', N'M.Bink', N'Welkom123', N'Student', NULL)
INSERT [dbo].[Persoon] ([PersoonId], [PersoonVoornaam], [PersoonAchternaam], [PersoonTelefoonnummer], [PersoonEmail], [PersoonStraat], [PersoonHuisnummer], [PersoonToevoegingHuisnr], [PersoonWoonplaats], [PersoonPostcode], [PersoonGebruikersnaam], [PersoonWachtwoord], [PersoonFunctie], [PersoonContractUren]) VALUES (7, N'Micha', N'Rijsmus', 123456789, N'1759213rijsmus@zuyd.nl', N'Wall straat', 1, N'A', N'Amsterdam', N'1234AB', N'M.Rijsmus', N'Welkom123', N'Docent', NULL)
SET IDENTITY_INSERT [dbo].[Persoon] OFF
SET IDENTITY_INSERT [dbo].[UrenCollege] ON 

INSERT [dbo].[UrenCollege] ([UrenCollegeId], [CollegeNaam]) VALUES (1, N'Hoorcollege')
INSERT [dbo].[UrenCollege] ([UrenCollegeId], [CollegeNaam]) VALUES (2, N'Werkcollege')
INSERT [dbo].[UrenCollege] ([UrenCollegeId], [CollegeNaam]) VALUES (3, N'DiscussieCollege')
SET IDENTITY_INSERT [dbo].[UrenCollege] OFF
SET IDENTITY_INSERT [dbo].[Vak] ON 

INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (1, N'Scripting', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (2, N'Testen', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (3, N'Programmeerconcepten', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (4, N'Bedrijfsprocessen', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (5, N'Inleiding ICT', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (6, N'Projectmanagement', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (7, N'Professioneel Handelen', NULL)
INSERT [dbo].[Vak] ([VakId], [VakNaam], [VakCode]) VALUES (8, N'Modellering', NULL)
SET IDENTITY_INSERT [dbo].[Vak] OFF
ALTER TABLE [dbo].[Authenticator]  WITH CHECK ADD  CONSTRAINT [FK_Authenticator_Persoon] FOREIGN KEY([Persoon_Id])
REFERENCES [dbo].[Persoon] ([PersoonId])
GO
ALTER TABLE [dbo].[Authenticator] CHECK CONSTRAINT [FK_Authenticator_Persoon]
GO
ALTER TABLE [dbo].[PersoonUren]  WITH CHECK ADD  CONSTRAINT [FK_PersoonUren_Persoon] FOREIGN KEY([Persoon_Id])
REFERENCES [dbo].[Persoon] ([PersoonId])
GO
ALTER TABLE [dbo].[PersoonUren] CHECK CONSTRAINT [FK_PersoonUren_Persoon]
GO
ALTER TABLE [dbo].[PersoonUren]  WITH CHECK ADD  CONSTRAINT [FK_PersoonUren_UrenBeschikbaarheid] FOREIGN KEY([UrenBeschikbaarheid_Id])
REFERENCES [dbo].[UrenBeschikbaarheid] ([UrenBeschikbaarheidId])
GO
ALTER TABLE [dbo].[PersoonUren] CHECK CONSTRAINT [FK_PersoonUren_UrenBeschikbaarheid]
GO
ALTER TABLE [dbo].[PersoonVak]  WITH CHECK ADD  CONSTRAINT [FK_PersoonVak_Persoon] FOREIGN KEY([Persoon_Id])
REFERENCES [dbo].[Persoon] ([PersoonId])
GO
ALTER TABLE [dbo].[PersoonVak] CHECK CONSTRAINT [FK_PersoonVak_Persoon]
GO
ALTER TABLE [dbo].[PersoonVak]  WITH CHECK ADD  CONSTRAINT [FK_PersoonVak_Vak] FOREIGN KEY([Vak_Id])
REFERENCES [dbo].[Vak] ([VakId])
GO
ALTER TABLE [dbo].[PersoonVak] CHECK CONSTRAINT [FK_PersoonVak_Vak]
GO
ALTER TABLE [dbo].[VakLokaalType]  WITH CHECK ADD  CONSTRAINT [FK_VakLokaalType_LokaalType] FOREIGN KEY([LokaalType_Id])
REFERENCES [dbo].[LokaalType] ([LokaalTypeId])
GO
ALTER TABLE [dbo].[VakLokaalType] CHECK CONSTRAINT [FK_VakLokaalType_LokaalType]
GO
ALTER TABLE [dbo].[VakLokaalType]  WITH CHECK ADD  CONSTRAINT [FK_VakLokaalType_Vak] FOREIGN KEY([Vak_Id])
REFERENCES [dbo].[Vak] ([VakId])
GO
ALTER TABLE [dbo].[VakLokaalType] CHECK CONSTRAINT [FK_VakLokaalType_Vak]
GO
ALTER TABLE [dbo].[VakUrenCollege]  WITH CHECK ADD  CONSTRAINT [FK_VakUrenCollege_UrenCollege] FOREIGN KEY([UrenCollege_Id])
REFERENCES [dbo].[UrenCollege] ([UrenCollegeId])
GO
ALTER TABLE [dbo].[VakUrenCollege] CHECK CONSTRAINT [FK_VakUrenCollege_UrenCollege]
GO
ALTER TABLE [dbo].[VakUrenCollege]  WITH CHECK ADD  CONSTRAINT [FK_VakUrenCollege_Vak] FOREIGN KEY([Vak_Id])
REFERENCES [dbo].[Vak] ([VakId])
GO
ALTER TABLE [dbo].[VakUrenCollege] CHECK CONSTRAINT [FK_VakUrenCollege_Vak]
GO
USE [master]
GO
ALTER DATABASE [RoosterDB] SET  READ_WRITE 
GO
