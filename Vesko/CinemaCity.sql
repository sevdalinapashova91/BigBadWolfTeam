USE [master]
GO
/****** Object:  Database [CinemaCity]    Script Date: 04-Nov-16 20:38:29 ******/
CREATE DATABASE [CinemaCity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaCity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CinemaCity.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CinemaCity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CinemaCity_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CinemaCity] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaCity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaCity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaCity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaCity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaCity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaCity] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaCity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaCity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaCity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaCity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaCity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaCity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaCity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaCity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaCity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaCity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CinemaCity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaCity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaCity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaCity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaCity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaCity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaCity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaCity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CinemaCity] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaCity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaCity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaCity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaCity] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CinemaCity] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CinemaCity]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cinema]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AddressesID] [int] NOT NULL,
 CONSTRAINT [PK_Cinema] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Films]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Rating] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Language] [nvarchar](2) NOT NULL,
	[Minutes] [int] NOT NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectionMovies]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectionMovies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectionID] [int] NOT NULL,
	[FilmID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectionMovies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectionRooms]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectionRooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Seats] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[CinemaID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectionRooms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projections]    Script Date: 04-Nov-16 20:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[ProjectionRoomID] [int] NOT NULL,
 CONSTRAINT [PK_Projections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([ID], [AddressText]) VALUES (1, N'Sofiq')
INSERT [dbo].[Addresses] ([ID], [AddressText]) VALUES (2, N'Pleven')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Cinema] ON 

INSERT [dbo].[Cinema] ([ID], [Name], [AddressesID]) VALUES (1, N'Cinema', 1)
INSERT [dbo].[Cinema] ([ID], [Name], [AddressesID]) VALUES (2, N'Arena', 2)
SET IDENTITY_INSERT [dbo].[Cinema] OFF
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([ID], [Title], [Rating], [Type], [Language], [Minutes]) VALUES (1, N'Harry Poter', N'7.2', N'Action', N'En', 120)
SET IDENTITY_INSERT [dbo].[Films] OFF
SET IDENTITY_INSERT [dbo].[ProjectionMovies] ON 

INSERT [dbo].[ProjectionMovies] ([ID], [ProjectionID], [FilmID]) VALUES (12, 4, 1)
INSERT [dbo].[ProjectionMovies] ([ID], [ProjectionID], [FilmID]) VALUES (14, 6, 1)
SET IDENTITY_INSERT [dbo].[ProjectionMovies] OFF
SET IDENTITY_INSERT [dbo].[ProjectionRooms] ON 

INSERT [dbo].[ProjectionRooms] ([ID], [Number], [Seats], [Type], [CinemaID]) VALUES (1, 12, 40, N'Action', 1)
INSERT [dbo].[ProjectionRooms] ([ID], [Number], [Seats], [Type], [CinemaID]) VALUES (2, 15, 30, N'Comedy', 2)
SET IDENTITY_INSERT [dbo].[ProjectionRooms] OFF
SET IDENTITY_INSERT [dbo].[Projections] ON 

INSERT [dbo].[Projections] ([ID], [Start], [Price], [ProjectionRoomID]) VALUES (4, CAST(N'2001-06-01 00:00:00.000' AS DateTime), 10.0000, 1)
INSERT [dbo].[Projections] ([ID], [Start], [Price], [ProjectionRoomID]) VALUES (6, CAST(N'2001-06-01 00:00:00.000' AS DateTime), 12.0000, 2)
SET IDENTITY_INSERT [dbo].[Projections] OFF
ALTER TABLE [dbo].[Cinema]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Addresses] FOREIGN KEY([AddressesID])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Cinema] CHECK CONSTRAINT [FK_Cinema_Addresses]
GO
ALTER TABLE [dbo].[ProjectionMovies]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionMovies_Films] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Films] ([ID])
GO
ALTER TABLE [dbo].[ProjectionMovies] CHECK CONSTRAINT [FK_ProjectionMovies_Films]
GO
ALTER TABLE [dbo].[ProjectionMovies]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionMovies_Projections] FOREIGN KEY([ProjectionID])
REFERENCES [dbo].[Projections] ([ID])
GO
ALTER TABLE [dbo].[ProjectionMovies] CHECK CONSTRAINT [FK_ProjectionMovies_Projections]
GO
ALTER TABLE [dbo].[ProjectionRooms]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionRooms_Cinema] FOREIGN KEY([CinemaID])
REFERENCES [dbo].[Cinema] ([ID])
GO
ALTER TABLE [dbo].[ProjectionRooms] CHECK CONSTRAINT [FK_ProjectionRooms_Cinema]
GO
ALTER TABLE [dbo].[Projections]  WITH CHECK ADD  CONSTRAINT [FK_Projections_ProjectionRooms] FOREIGN KEY([ProjectionRoomID])
REFERENCES [dbo].[ProjectionRooms] ([ID])
GO
ALTER TABLE [dbo].[Projections] CHECK CONSTRAINT [FK_Projections_ProjectionRooms]
GO
USE [master]
GO
ALTER DATABASE [CinemaCity] SET  READ_WRITE 
GO
