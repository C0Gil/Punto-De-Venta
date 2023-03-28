USE [master]
GO
/****** Object:  Database [tienda]    Script Date: 27/03/2023 08:24:58 p. m. ******/
CREATE DATABASE [tienda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tienda', FILENAME = N'C:\SQLData\tienda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tienda_log', FILENAME = N'C:\SQLData\tienda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tienda] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tienda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tienda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tienda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tienda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tienda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tienda] SET ARITHABORT OFF 
GO
ALTER DATABASE [tienda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tienda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tienda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tienda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tienda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tienda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tienda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tienda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tienda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tienda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tienda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tienda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tienda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tienda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tienda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tienda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tienda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tienda] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tienda] SET  MULTI_USER 
GO
ALTER DATABASE [tienda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tienda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tienda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tienda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tienda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tienda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tienda] SET QUERY_STORE = ON
GO
ALTER DATABASE [tienda] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tienda]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] NOT NULL,
	[nombre_cat] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompraProducto]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraProducto](
	[idCompraProducto] [int] NULL,
	[idProducto] [int] NULL,
	[idCompra] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[idCompra] [int] NULL,
	[monto] [real] NULL,
	[idCompraProducto] [int] NULL,
	[provedor] [nvarchar](50) NULL,
	[fechaCompra] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] NOT NULL,
	[producto] [nvarchar](50) NULL,
	[precioVenta] [real] NULL,
	[precioCompra] [real] NULL,
	[fechaCaducidad] [date] NULL,
	[stock] [int] NULL,
	[disponibilidad] [bit] NULL,
	[idCategoria] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[usuario] [nvarchar](50) NULL,
	[psw] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaProducto]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaProducto](
	[idVentaProducto] [int] NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[idVenta] [int] NULL,
	[fechaVenta] [datetime] NULL,
	[idVentaProducto] [int] NULL,
	[monto] [real] NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaVendedor]    Script Date: 27/03/2023 08:24:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaVendedor](
	[idVentaVendedor] [int] NULL,
	[idUsuario] [int] NULL,
	[idVenta] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [tienda] SET  READ_WRITE 
GO
