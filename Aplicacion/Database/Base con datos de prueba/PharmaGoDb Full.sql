USE [master]
GO
/****** Object:  Database [PharmaGoDb]    Script Date: 10/11/2023 12:01:49 ******/
CREATE DATABASE [PharmaGoDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmaGoDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PharmaGoDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PharmaGoDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PharmaGoDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PharmaGoDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmaGoDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmaGoDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmaGoDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmaGoDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmaGoDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmaGoDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmaGoDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmaGoDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmaGoDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PharmaGoDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmaGoDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmaGoDb] SET  MULTI_USER 
GO
ALTER DATABASE [PharmaGoDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmaGoDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmaGoDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmaGoDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PharmaGoDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PharmaGoDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PharmaGoDb] SET QUERY_STORE = OFF
GO
USE [PharmaGoDb]
GO
/****** Object:  User [marcelo]    Script Date: 10/11/2023 12:01:49 ******/
CREATE USER [marcelo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[marcelo]
GO
/****** Object:  Schema [marcelo]    Script Date: 10/11/2023 12:01:49 ******/
CREATE SCHEMA [marcelo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/11/2023 12:01:49 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Symptom] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Prescription] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[UnitMeasureId] [int] NULL,
	[PresentationId] [int] NULL,
	[PharmacyId] [int] NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitations]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PharmacyId] [int] NULL,
	[RoleId] [int] NULL,
	[UserCode] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Invitations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacys]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pharmacys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentations]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Stock] [int] NOT NULL,
	[PharmacyId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetailProduct]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetailProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PharmacyId] [int] NULL,
	[Status] [nvarchar](max) NULL,
	[PurchaseId] [int] NULL,
 CONSTRAINT [PK_PurchaseDetailProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[PurchaseId] [int] NULL,
	[PharmacyId] [int] NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [datetime2](7) NOT NULL,
	[TotalAmount] [decimal](14, 2) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[TrackingCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequestDetails]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockRequestDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[StockRequestId] [int] NULL,
 CONSTRAINT [PK_StockRequestDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequests]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[RequestDate] [datetime2](7) NOT NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_StockRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitMeasures]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMeasures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitMeasures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/11/2023 12:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[RegistrationDate] [datetime2](7) NULL,
	[RoleId] [int] NULL,
	[PharmacyId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220910212258_InitialCreate', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917182456_AddSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917191530_ChangeSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917232725_CheckSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220918192623_RemoveUseCodeFromUserEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221001173323_UpdateUserAndInvitationEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221001183953_UnitMeasurePresentationConversions', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221002194836_nullablePharmacyOfDrug', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221010173819_PurchaseV2', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221013003816_RemoveEnums', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020183015_AddProduct', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231023230618_AddPurchaseProductDetailToDB', N'6.0.8')
GO
SET IDENTITY_INSERT [dbo].[Drugs] ON 

INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (1, N'XDEA', N'Novemina', N'Dolor de cabeza', 1000, CAST(50.00 AS Decimal(14, 2)), 1824, 0, 1, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (2, N'ABCD', N'Perifar Flex', N'Fiebre', 1000, CAST(125.00 AS Decimal(14, 2)), 1101, 1, 1, 1, 2, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (3, N'ZASW', N'Aspirina', N'Dolor en general', 2000, CAST(25.00 AS Decimal(14, 2)), 199958, 1, 1, 1, 2, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (4, N'XDEA', N'Aspirineta', N'Dolor en general', 2000, CAST(50.00 AS Decimal(14, 2)), 248, 0, 0, 1, 1, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (5, N'ZZDEA', N'Aspirineta', N'Dolor en general', 2000, CAST(50.00 AS Decimal(14, 2)), 0, 0, 0, 1, 1, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (6, N'ZQDEA', N'Aspirineta', N'Dolor en general', 2000, CAST(50.00 AS Decimal(14, 2)), 0, 0, 0, 1, 1, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (7, N'ZXC', N'Redoxon zinc 10 Comprimidos Efervescente', N'REDOXON+ZINC 10 COMPRIMIDOS EFERVESCENTE', 250, CAST(500.00 AS Decimal(14, 2)), 0, 1, 0, 1, 2, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (8, N'ABR', N'Abrilar Jarabe 100 Ml', N'Tos', 1000, CAST(250.00 AS Decimal(14, 2)), 0, 0, 0, 2, 3, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (9, N'BIO', N'Bio Grip Plus 8 Comprimidos', N'Gripe', 10000, CAST(1250.00 AS Decimal(14, 2)), 0, 0, 1, 2, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (10, N'ASCX', N'aaaaa', N'eeeeeeee', 100, CAST(120.00 AS Decimal(14, 2)), 0, 0, 1, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (11, N'ZXZ', N'qwewr', N'asdda', 100, CAST(40.00 AS Decimal(14, 2)), 0, 0, 1, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (12, N'WWW', N'asdasasfasf', N'sadsadasd', 23, CAST(500.00 AS Decimal(14, 2)), 0, 1, 1, 2, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (13, N'VVVVV', N'wwwwww', N'aasdasdasd adasdasdasd', 120, CAST(50.00 AS Decimal(14, 2)), 0, 0, 1, 3, 3, 2)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (14, N'GFR', N'Novemina Fuerte', N'Dolor general', 1000, CAST(100.00 AS Decimal(14, 2)), 11052, 0, 0, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (15, N'VGT', N'Paracetamol 1 Gr 10 Comprimidos ', N'Gripe, Fiebre, Dolor de cabeza', 100, CAST(150.00 AS Decimal(14, 2)), 100, 0, 0, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (16, N'ZAQ', N'Teofilina Efa 250 Mg 30 Comprimidos', N'Metilxantina broncodilatadora indicada en las crisis asmáticas y otras situaciones que cursen con broncoespasmo.', 1000, CAST(750.00 AS Decimal(14, 2)), 100, 0, 0, 1, 2, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (17, N'FRE', N'Alerfedine 120 Mg 10', N'Antialérgico.', 10000, CAST(200.00 AS Decimal(14, 2)), 100, 0, 0, 1, 4, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (18, N'JBT', N'Mucotosil Adultos Jarabe 120 Ml', N'Mucolítico', 2000, CAST(450.00 AS Decimal(14, 2)), 99, 1, 0, 3, 3, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (19, N'WER', N'Lordex 10 Comprimidos', N'Asociación antialérgica de un antihistamínico con corticoides', 5000, CAST(300.00 AS Decimal(14, 2)), 99, 1, 0, 2, 4, 3)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (20, N'GRT', N'Histacetin 10 Comprimidos', N'Antialérgico. Antihistamínico H1 de acción prolongada sin efecto sedante.', 3000, CAST(1000.00 AS Decimal(14, 2)), 100, 1, 0, 1, 1, 3)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (21, N'TOS', N'Tosilar Jarabe 100 Ml', N'Espasmolítico', 54000, CAST(1200.00 AS Decimal(14, 2)), 100, 1, 0, 4, 3, 3)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (22, N'HND', N'Kalitron Fuerte 10 Grageas', N'Asociación antialérgica de un antihistamínico con corticoides.', 4000, CAST(550.00 AS Decimal(14, 2)), 100, 0, 0, 1, 2, 3)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (23, N'LOR', N'Loratadina Ion Solucion 30 Ml', N'Antialérgico.', 5000, CAST(1100.00 AS Decimal(14, 2)), 100, 0, 0, 3, 3, 3)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (24, N'ABCD', N'Test drug', N'diarrea', 20, CAST(200.00 AS Decimal(14, 2)), 0, 0, 0, 1, 1, 4)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (25, N'AAAAAAA', N'New Drug Test', N'muchisima diarrea', 20, CAST(200.00 AS Decimal(14, 2)), 0, 0, 0, 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Drugs] OFF
GO
SET IDENTITY_INSERT [dbo].[Invitations] ON 

INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (1, N'admin1', CAST(N'2022-10-06T16:37:17.7558876' AS DateTime2), NULL, 1, N'391668', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (2, N'employee1', CAST(N'2022-10-06T16:38:41.2817995' AS DateTime2), 1, 2, N'026041', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (3, N'owner1', CAST(N'2022-10-06T16:38:55.3009591' AS DateTime2), 1, 3, N'138667', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (4, N'employee20', CAST(N'2022-11-05T14:54:40.7669183' AS DateTime2), 2, 2, N'006527', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (5, N'admin20', CAST(N'2022-11-05T15:08:27.4899589' AS DateTime2), NULL, 1, N'747342', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (6, N'admin30', CAST(N'2022-11-05T15:31:29.4721078' AS DateTime2), 2, 2, N'273477', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (7, N'admin45', CAST(N'2022-11-05T15:32:21.7292276' AS DateTime2), 2, 2, N'789377', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (8, N'wwwww', CAST(N'2022-11-05T15:35:54.1796876' AS DateTime2), 2, 2, N'555396', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (9, N'owner2022', CAST(N'2022-11-05T15:44:28.0028757' AS DateTime2), 1, 3, N'305555', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (10, N'admin333', CAST(N'2022-11-13T15:12:39.9130849' AS DateTime2), 3, 2, N'415768', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (11, N'marcelo', CAST(N'2022-11-13T15:13:29.3672875' AS DateTime2), 1, 2, N'417578', 1)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (12, N'employee2', CAST(N'2022-11-16T18:38:07.7323243' AS DateTime2), 3, 2, N'054245', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (13, N'owner2', CAST(N'2022-11-16T18:38:19.2029982' AS DateTime2), 3, 3, N'811601', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (14, N'Employee test', CAST(N'2023-09-17T00:36:42.4695564' AS DateTime2), 4, 2, N'409424', 0)
SET IDENTITY_INSERT [dbo].[Invitations] OFF
GO
SET IDENTITY_INSERT [dbo].[Pharmacys] ON 

INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (1, N'Farmacia 1234', N'Av Uruguay 23223')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (2, N'Farmacia Av. Italia', N'Av Italia 9822')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (3, N'San Roque Pocitos', N'Pocitos 12345')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (4, N'Farmacia test name', N'Farmacia test address')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (5, N'aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeee', N'address')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (6, N'farmacia', N'farmacia direccion')
SET IDENTITY_INSERT [dbo].[Pharmacys] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentations] ON 

INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (1, N'capsules', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (2, N'tablet', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (3, N'liquid', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (4, N'patches', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (5, N'injections', 0)
SET IDENTITY_INSERT [dbo].[Presentations] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Code], [Name], [Description], [Price], [Deleted], [Stock], [PharmacyId]) VALUES (2, N'AAAA', N'Product test 1', N'Product test 1', CAST(1000.00 AS Decimal(14, 2)), 0, 96, 2)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Description], [Price], [Deleted], [Stock], [PharmacyId]) VALUES (6, N'BBBB', N'Product test 2', N'Product test 2', CAST(100.00 AS Decimal(14, 2)), 0, 10, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetailProduct] ON 

INSERT [dbo].[PurchaseDetailProduct] ([Id], [ProductId], [Quantity], [Price], [PharmacyId], [Status], [PurchaseId]) VALUES (1, 2, 17, CAST(1000.00 AS Decimal(18, 2)), 2, N'Pending', 30)
INSERT [dbo].[PurchaseDetailProduct] ([Id], [ProductId], [Quantity], [Price], [PharmacyId], [Status], [PurchaseId]) VALUES (2, 6, 2, CAST(100.00 AS Decimal(18, 2)), 1, N'Pending', 30)
INSERT [dbo].[PurchaseDetailProduct] ([Id], [ProductId], [Quantity], [Price], [PharmacyId], [Status], [PurchaseId]) VALUES (3, 2, 3, CAST(1000.00 AS Decimal(18, 2)), 2, N'Pending', 31)
INSERT [dbo].[PurchaseDetailProduct] ([Id], [ProductId], [Quantity], [Price], [PharmacyId], [Status], [PurchaseId]) VALUES (4, 2, 1, CAST(1000.00 AS Decimal(18, 2)), 2, N'Pending', 32)
SET IDENTITY_INSERT [dbo].[PurchaseDetailProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetails] ON 

INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (9, 2, 23, CAST(125.00 AS Decimal(14, 2)), 4, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (10, 1, 12, CAST(50.00 AS Decimal(14, 2)), 4, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (11, 4, 2, CAST(50.00 AS Decimal(14, 2)), 4, 2, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (12, 2, 23, CAST(125.00 AS Decimal(14, 2)), 5, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (13, 1, 12, CAST(50.00 AS Decimal(14, 2)), 5, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (14, 4, 2, CAST(50.00 AS Decimal(14, 2)), 5, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (15, 2, 23, CAST(125.00 AS Decimal(14, 2)), 6, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (16, 1, 12, CAST(50.00 AS Decimal(14, 2)), 6, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (17, 4, 2, CAST(50.00 AS Decimal(14, 2)), 6, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (18, 1, 1, CAST(50.00 AS Decimal(14, 2)), 7, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (19, 4, 1, CAST(50.00 AS Decimal(14, 2)), 7, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (20, 1, 2, CAST(50.00 AS Decimal(14, 2)), 8, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (21, 4, 1, CAST(50.00 AS Decimal(14, 2)), 8, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (22, 2, 1, CAST(125.00 AS Decimal(14, 2)), 9, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (23, 1, 1, CAST(50.00 AS Decimal(14, 2)), 10, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (24, 1, 1, CAST(50.00 AS Decimal(14, 2)), 11, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (25, 1, 12, CAST(50.00 AS Decimal(14, 2)), 12, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (26, 4, 13, CAST(50.00 AS Decimal(14, 2)), 12, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (27, 1, 1, CAST(50.00 AS Decimal(14, 2)), 13, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (28, 1, 1, CAST(50.00 AS Decimal(14, 2)), 14, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (29, 1, 1, CAST(50.00 AS Decimal(14, 2)), 15, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (30, 2, 1, CAST(125.00 AS Decimal(14, 2)), 16, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (31, 1, 1, CAST(50.00 AS Decimal(14, 2)), 16, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (32, 1, 15, CAST(50.00 AS Decimal(14, 2)), 17, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (33, 2, 3, CAST(125.00 AS Decimal(14, 2)), 17, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (34, 1, 15, CAST(50.00 AS Decimal(14, 2)), 18, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (35, 2, 3, CAST(125.00 AS Decimal(14, 2)), 18, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (36, 1, 15, CAST(50.00 AS Decimal(14, 2)), 19, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (37, 2, 3, CAST(125.00 AS Decimal(14, 2)), 19, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (38, 1, 10, CAST(50.00 AS Decimal(14, 2)), 20, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (39, 4, 15, CAST(50.00 AS Decimal(14, 2)), 20, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (40, 1, 1, CAST(50.00 AS Decimal(14, 2)), 21, 1, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (41, 4, 1, CAST(50.00 AS Decimal(14, 2)), 21, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (42, 1, 16, CAST(50.00 AS Decimal(14, 2)), 22, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (43, 4, 2, CAST(50.00 AS Decimal(14, 2)), 22, 2, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (44, 4, 2, CAST(50.00 AS Decimal(14, 2)), 23, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (45, 14, 501, CAST(100.00 AS Decimal(14, 2)), 24, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (46, 4, 1, CAST(50.00 AS Decimal(14, 2)), 25, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (47, 4, 1, CAST(50.00 AS Decimal(14, 2)), 26, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (48, 14, 2, CAST(100.00 AS Decimal(14, 2)), 26, 1, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (49, 19, 1, CAST(300.00 AS Decimal(14, 2)), 27, 3, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (50, 14, 1, CAST(100.00 AS Decimal(14, 2)), 27, 1, N'Rejected')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (51, 4, 1, CAST(50.00 AS Decimal(14, 2)), 27, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (52, 18, 1, CAST(450.00 AS Decimal(14, 2)), 27, 1, N'Approved')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (53, 14, 4, CAST(100.00 AS Decimal(14, 2)), 30, 1, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (54, 4, 2, CAST(50.00 AS Decimal(14, 2)), 31, 2, N'Pending')
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId], [PharmacyId], [Status]) VALUES (55, 14, 1, CAST(100.00 AS Decimal(14, 2)), 32, 1, N'Pending')
SET IDENTITY_INSERT [dbo].[PurchaseDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (4, CAST(N'2022-10-05T10:21:31.8160000' AS DateTime2), CAST(3375.00 AS Decimal(14, 2)), N'santi@gmail.com', N'FROR7HWPUH5JWW4C')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (5, CAST(N'2022-10-05T10:21:31.8160000' AS DateTime2), CAST(3575.00 AS Decimal(14, 2)), N'santi@gmail.com', N'BOOHZPI9QR9B3UW9')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (6, CAST(N'2022-10-05T10:21:31.8160000' AS DateTime2), CAST(3575.00 AS Decimal(14, 2)), N'santi@gmail.com', N'1FM5EVO6RJQQ5YX2')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (7, CAST(N'2022-10-21T02:28:38.8520000' AS DateTime2), CAST(100.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'WX7P2ZWUMO667UD0')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (8, CAST(N'2022-10-21T02:39:22.6540000' AS DateTime2), CAST(150.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'WAAWV9MRXJ8SA2P7')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (9, CAST(N'2022-10-21T02:42:33.2970000' AS DateTime2), CAST(125.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'13HMDDQN3ITVG0QT')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (10, CAST(N'2022-10-21T02:47:38.8170000' AS DateTime2), CAST(50.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'HE8O04PT6IRMCDUM')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (11, CAST(N'2022-10-21T02:54:56.5450000' AS DateTime2), CAST(50.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'8N5OEVQAVBI2LSPI')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (12, CAST(N'2022-10-21T13:44:27.0830000' AS DateTime2), CAST(1250.00 AS Decimal(14, 2)), N'pedro@gmail.com', N'2ANW1V94FMSW9AEM')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (13, CAST(N'2022-10-22T14:35:32.8420000' AS DateTime2), CAST(-50.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'VY0MW2PYEYTAWLNZ')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (14, CAST(N'2022-10-22T18:02:15.5280000' AS DateTime2), CAST(-550.00 AS Decimal(14, 2)), N'mm@gmail.com', N'QSEOVBVDLNU4SAP3')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (15, CAST(N'2022-10-22T18:04:14.1970000' AS DateTime2), CAST(-2875.00 AS Decimal(14, 2)), N'asd@gmail.com', N'O3EOO59860X7PRV2')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (16, CAST(N'2022-10-22T18:13:46.6310000' AS DateTime2), CAST(25.00 AS Decimal(14, 2)), N'asd@gmail.com', N'LH196WOL68APCI6A')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (17, CAST(N'2022-10-24T01:26:01.3980000' AS DateTime2), CAST(-600.00 AS Decimal(14, 2)), N'jose@gmail.com', N'5IAFLYD6ZPZL8IVU')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (18, CAST(N'2022-10-24T01:30:07.4630000' AS DateTime2), CAST(325.00 AS Decimal(14, 2)), N'jose2@gmail.com', N'89JT7QBT3M64EO1R')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (19, CAST(N'2022-10-24T03:10:51.8700000' AS DateTime2), CAST(375.00 AS Decimal(14, 2)), N'jose3@gmail.com', N'7T14V5UI5Z7JE3RD')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (20, CAST(N'2022-10-24T03:13:51.0880000' AS DateTime2), CAST(750.00 AS Decimal(14, 2)), N'jose4@gmail.com', N'814V4R04F5ZBKSLL')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (21, CAST(N'2022-10-27T23:41:05.8030000' AS DateTime2), CAST(100.00 AS Decimal(14, 2)), N'pedro@gmail.com', N'WE0VJ5XKKYS3CNIT')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (22, CAST(N'2022-11-05T17:35:02.8140000' AS DateTime2), CAST(100.00 AS Decimal(14, 2)), N'carlitos@gmail.com', N'WCQQILD1NWWY1DNV')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (23, CAST(N'2022-11-13T18:21:48.4480000' AS DateTime2), CAST(100.00 AS Decimal(14, 2)), N'felipe.rodriguez@gmail.com', N'QWKTKH8BT5OJCW9S')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (24, CAST(N'2022-11-13T19:01:01.4800000' AS DateTime2), CAST(50100.00 AS Decimal(14, 2)), N'fernando@gmail.com', N'ZE7Y2YYPT1JXSYWM')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (25, CAST(N'2022-11-14T00:48:49.9610000' AS DateTime2), CAST(50.00 AS Decimal(14, 2)), N'marcelo@gmail.com', N'23FAG5ZVCUZS4V3I')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (26, CAST(N'2022-11-14T00:51:15.0700000' AS DateTime2), CAST(250.00 AS Decimal(14, 2)), N'mariano@gmail.com', N'DLNZ6N5X80AXWBLS')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (27, CAST(N'2022-11-16T21:45:14.8500000' AS DateTime2), CAST(800.00 AS Decimal(14, 2)), N'felipe@gmail.com', N'85PXZXQ7FRNT0M4D')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (30, CAST(N'2023-10-23T23:09:21.1810000' AS DateTime2), CAST(17600.00 AS Decimal(14, 2)), N'email@email.com', N'L7P4KA0W8S7VV8TU')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (31, CAST(N'2023-10-23T23:22:50.5950000' AS DateTime2), CAST(3100.00 AS Decimal(14, 2)), N'email@email.com', N'EOSBRDK4QBFAI37B')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [BuyerEmail], [TrackingCode]) VALUES (32, CAST(N'2023-10-24T00:18:59.6090000' AS DateTime2), CAST(1100.00 AS Decimal(14, 2)), N'email@email.com', N'PP4H9GA1PXQTQBUG')
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Employee')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Owner')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (1, N'3a3c2363-d3ca-4deb-b2dd-c71300429d84', 1)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (2, N'e9e0e1e9-3812-4eb5-949e-ae92ac931401', 4)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (3, N'326df984-a9f4-45a8-8a0b-79328578cc7c', 3)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (4, N'81c22e46-c41a-4a4a-85db-4b12e604dfc9', 5)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (5, N'17bab9a0-04ee-43d0-aed2-8a5f2009db18', 6)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (6, N'7dec8321-c89d-4f63-b4f9-0c671e741510', 8)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (7, N'59c25ed6-1090-49fd-adf2-de24e1e932f0', 7)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (8, N'bd840a19-9a00-4915-a7e2-8bd40557842a', 9)
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[StockRequestDetails] ON 

INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (1, 2, 1200, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (2, 1, 2000, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (3, 3, 200000, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (4, 2, 200, 2)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (5, 1, 350, 2)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (6, 2, 200, 3)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (7, 1, 350, 3)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (8, 1, 1, 4)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (9, 2, 2, 4)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (10, 1, 1, 5)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (11, 2, 2, 5)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (12, 1, 1, 6)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (13, 1, 1, 7)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (14, 11, 100, 8)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (15, 1, 1, 9)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (16, 2, 1, 9)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (17, 10, 1, 9)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (18, 11, 8, 9)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (19, 10, 40, 10)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (20, 2, 3, 10)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (21, 7, 20, 11)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (22, 4, 20, 11)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (23, 14, 500, 12)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (24, 14, 1, 13)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (25, 14, 1000, 14)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (26, 14, 100, 15)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (27, 15, 100, 15)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (28, 16, 100, 15)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (29, 17, 100, 15)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (30, 18, 100, 15)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (31, 19, 100, 16)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (32, 20, 100, 16)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (33, 21, 100, 16)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (34, 22, 100, 16)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (35, 23, 100, 16)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (36, 14, 10000, 17)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (37, 14, -48, 18)
SET IDENTITY_INSERT [dbo].[StockRequestDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[StockRequests] ON 

INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (1, 3, CAST(N'2022-10-06T16:46:17.4805118' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (2, 2, CAST(N'2022-10-06T16:47:37.9672539' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (3, 2, CAST(N'2022-10-10T15:06:00.7195011' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (4, 2, CAST(N'2022-11-03T20:54:23.7758022' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (5, 2, CAST(N'2022-11-03T20:55:27.9075100' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (6, 2, CAST(N'2022-11-03T20:56:04.5776349' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (7, 2, CAST(N'2022-11-03T20:56:34.2083236' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (8, 2, CAST(N'2022-11-03T20:56:43.8313148' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (9, 2, CAST(N'2022-11-03T20:58:16.8633664' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (10, 2, CAST(N'2022-11-05T14:40:44.2294652' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (11, 1, CAST(N'2022-11-05T15:01:17.5256845' AS DateTime2), 5)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (12, 3, CAST(N'2022-11-13T15:58:22.8137798' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (13, 3, CAST(N'2022-11-13T16:04:01.5388433' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (14, 3, CAST(N'2022-11-13T21:50:07.1024698' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (15, 3, CAST(N'2022-11-16T18:36:59.1518963' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (16, 3, CAST(N'2022-11-16T18:44:06.4953087' AS DateTime2), 8)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (17, 3, CAST(N'2023-09-18T12:37:49.9366729' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (18, 3, CAST(N'2023-09-18T12:41:59.8129846' AS DateTime2), 4)
SET IDENTITY_INSERT [dbo].[StockRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitMeasures] ON 

INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (1, N'mg', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (2, N'g', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (3, N'ml', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (4, N'l', 0)
SET IDENTITY_INSERT [dbo].[UnitMeasures] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (1, N'admin', N'admin@gmail.com', N'Aqwertyu2.', N'Av. Rivera 3366', CAST(N'2022-10-06T14:25:10.4870000' AS DateTime2), 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (2, N'admin1', N'admin1@gmail.com', N'Aqwertyu2.', N'18 de Julio', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (3, N'owner1', N'owner1@gmail.com', N'Aqwertyu2.', N'18 de Julio 33333', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 3, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (4, N'employee1', N'employee1@gmail.com', N'Aqwertyu2.', N'Charrua 123', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 2, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (5, N'employee20', N'employee20@gmail.com', N'Aqwertyu2.', N'casa 2223 232323', CAST(N'2022-11-05T17:57:33.6990000' AS DateTime2), 2, 2)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (6, N'admin20', N'admin20@gmail.com', N'Aqwertyu2.', N'          ', CAST(N'2022-11-05T18:26:48.7260000' AS DateTime2), 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (7, N'owner2', N'owner2@gmail.com', N'Aqwertyu2.', N'Bv. Artigas 3344', CAST(N'2022-11-16T21:39:39.3760000' AS DateTime2), 3, 3)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (8, N'employee2', N'employee2@gmail.com', N'Aqwertyu2.', N'26 de Marzo 9321', CAST(N'2022-11-16T21:40:24.6850000' AS DateTime2), 2, 3)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (9, N'Employee test', N'employeetest@mail.com', N'Contraseña.00', N'test address', CAST(N'2023-09-17T03:54:47.5500000' AS DateTime2), 2, 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Drugs_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_PharmacyId] ON [dbo].[Drugs]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drugs_PresentationId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_PresentationId] ON [dbo].[Drugs]
(
	[PresentationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drugs_UnitMeasureId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_UnitMeasureId] ON [dbo].[Drugs]
(
	[UnitMeasureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invitations_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Invitations_PharmacyId] ON [dbo].[Invitations]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invitations_RoleId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Invitations_RoleId] ON [dbo].[Invitations]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Products_PharmacyId] ON [dbo].[Products]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetailProduct_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetailProduct_PharmacyId] ON [dbo].[PurchaseDetailProduct]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetailProduct_ProductId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetailProduct_ProductId] ON [dbo].[PurchaseDetailProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetailProduct_PurchaseId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetailProduct_PurchaseId] ON [dbo].[PurchaseDetailProduct]
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_DrugId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_DrugId] ON [dbo].[PurchaseDetails]
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_PharmacyId] ON [dbo].[PurchaseDetails]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_PurchaseId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_PurchaseId] ON [dbo].[PurchaseDetails]
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequestDetails_DrugId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_StockRequestDetails_DrugId] ON [dbo].[StockRequestDetails]
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequestDetails_StockRequestId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_StockRequestDetails_StockRequestId] ON [dbo].[StockRequestDetails]
(
	[StockRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequests_EmployeeId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_StockRequests_EmployeeId] ON [dbo].[StockRequests]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_PharmacyId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Users_PharmacyId] ON [dbo].[Users]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 10/11/2023 12:01:49 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [PharmacyId]
GO
ALTER TABLE [dbo].[Invitations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_Presentations_PresentationId] FOREIGN KEY([PresentationId])
REFERENCES [dbo].[Presentations] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_Presentations_PresentationId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_UnitMeasures_UnitMeasureId] FOREIGN KEY([UnitMeasureId])
REFERENCES [dbo].[UnitMeasures] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_UnitMeasures_UnitMeasureId]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invitations_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invitations_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invitations_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invitations_Roles_RoleId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[PurchaseDetailProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetailProduct_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetailProduct] CHECK CONSTRAINT [FK_PurchaseDetailProduct_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[PurchaseDetailProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetailProduct_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetailProduct] CHECK CONSTRAINT [FK_PurchaseDetailProduct_Products_ProductId]
GO
ALTER TABLE [dbo].[PurchaseDetailProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetailProduct_Purchases_PurchaseId] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchases] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetailProduct] CHECK CONSTRAINT [FK_PurchaseDetailProduct_Purchases_PurchaseId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchases] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId]
GO
ALTER TABLE [dbo].[StockRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StockRequestDetails_Drugs_DrugId] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([Id])
GO
ALTER TABLE [dbo].[StockRequestDetails] CHECK CONSTRAINT [FK_StockRequestDetails_Drugs_DrugId]
GO
ALTER TABLE [dbo].[StockRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StockRequestDetails_StockRequests_StockRequestId] FOREIGN KEY([StockRequestId])
REFERENCES [dbo].[StockRequests] ([Id])
GO
ALTER TABLE [dbo].[StockRequestDetails] CHECK CONSTRAINT [FK_StockRequestDetails_StockRequests_StockRequestId]
GO
ALTER TABLE [dbo].[StockRequests]  WITH CHECK ADD  CONSTRAINT [FK_StockRequests_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[StockRequests] CHECK CONSTRAINT [FK_StockRequests_Users_EmployeeId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [PharmaGoDb] SET  READ_WRITE 
GO
