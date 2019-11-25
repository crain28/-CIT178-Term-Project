USE [master]
GO
/****** Object:  Database [NorthernStarFarms]    Script Date: 10/2/2019 2:44:45 PM ******/
CREATE DATABASE [NorthernStarFarms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Customers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Customers.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Customers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Customers_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NorthernStarFarms] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NorthernStarFarms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NorthernStarFarms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET ARITHABORT OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NorthernStarFarms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NorthernStarFarms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NorthernStarFarms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NorthernStarFarms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET RECOVERY FULL 
GO
ALTER DATABASE [NorthernStarFarms] SET  MULTI_USER 
GO
ALTER DATABASE [NorthernStarFarms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NorthernStarFarms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NorthernStarFarms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NorthernStarFarms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NorthernStarFarms] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NorthernStarFarms', N'ON'
GO
ALTER DATABASE [NorthernStarFarms] SET QUERY_STORE = OFF
GO
USE [NorthernStarFarms]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NOT NULL,
	[CustomerName] [varchar](30) NOT NULL,
	[CustomerPhone] [varchar](30) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] NOT NULL,
	[PlaceName] [nchar](30) NOT NULL,
	[PlaceAddress] [varchar](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quanity] [varchar](50) NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] NOT NULL,
	[Date] [varchar](50) NULL,
	[CustomerID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Type] [nchar](20) NOT NULL,
	[PricePerBale] [int] NOT NULL,
	[Description] [varchar](60) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 10/2/2019 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCode](
	[ZipCode]  [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](30) NULL,
 CONSTRAINT [PK_ZipCode] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [NorthernStarFarms] SET  READ_WRITE 
GO