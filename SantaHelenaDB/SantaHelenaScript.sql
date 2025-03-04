USE [master]
GO
/****** Object:  Database [Santa Helena Campestre]    Script Date: 13/05/2024 7:24:00 a. m. ******/
CREATE DATABASE [Santa Helena Campestre]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Santa Helena Campestre', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Santa Helena Campestre.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Santa Helena Campestre_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Santa Helena Campestre_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Santa Helena Campestre] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Santa Helena Campestre].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Santa Helena Campestre] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET ARITHABORT OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Santa Helena Campestre] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Santa Helena Campestre] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Santa Helena Campestre] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Santa Helena Campestre] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET RECOVERY FULL 
GO
ALTER DATABASE [Santa Helena Campestre] SET  MULTI_USER 
GO
ALTER DATABASE [Santa Helena Campestre] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Santa Helena Campestre] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Santa Helena Campestre] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Santa Helena Campestre] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Santa Helena Campestre] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Santa Helena Campestre] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Santa Helena Campestre', N'ON'
GO
ALTER DATABASE [Santa Helena Campestre] SET QUERY_STORE = OFF
GO
USE [Santa Helena Campestre]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 13/05/2024 7:24:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[idUsuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[medioPago] [varchar](50) NOT NULL,
	[idDomicilio] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 13/05/2024 7:24:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[idProducto] [int] NOT NULL,
	[idDomicilio] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valorItem] [real] NOT NULL,
	[idItem] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 13/05/2024 7:24:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[precio] [real] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/05/2024 7:24:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] NOT NULL,
	[tipoID] [varchar](3) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_Domicilio_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_Domicilio_Usuario]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Domicilio] FOREIGN KEY([idDomicilio])
REFERENCES [dbo].[Domicilio] ([idDomicilio])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Domicilio]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Producto]
GO
USE [master]
GO
ALTER DATABASE [Santa Helena Campestre] SET  READ_WRITE 
GO
