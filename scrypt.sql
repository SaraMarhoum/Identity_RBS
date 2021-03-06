USE [master]
GO
/****** Object:  Database [std]    Script Date: 04/03/2021 09:28:14 ******/
CREATE DATABASE [std]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'std', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\std.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'std_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\std_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [std] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [std].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [std] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [std] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [std] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [std] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [std] SET ARITHABORT OFF 
GO
ALTER DATABASE [std] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [std] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [std] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [std] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [std] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [std] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [std] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [std] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [std] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [std] SET  ENABLE_BROKER 
GO
ALTER DATABASE [std] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [std] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [std] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [std] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [std] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [std] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [std] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [std] SET RECOVERY FULL 
GO
ALTER DATABASE [std] SET  MULTI_USER 
GO
ALTER DATABASE [std] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [std] SET DB_CHAINING OFF 
GO
ALTER DATABASE [std] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [std] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [std] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [std] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'std', N'ON'
GO
ALTER DATABASE [std] SET QUERY_STORE = OFF
GO
USE [std]
GO
/****** Object:  Table [dbo].[table1DBFirst]    Script Date: 04/03/2021 09:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table1DBFirst](
	[id] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Adresse] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablestd]    Script Date: 04/03/2021 09:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablestd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](150) NULL,
	[prenom] [varchar](150) NULL,
	[cin] [varchar](150) NULL,
	[adresse] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SelectStudents]    Script Date: 04/03/2021 09:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStudents] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	SELECT * FROM tablestd
END
GO
USE [master]
GO
ALTER DATABASE [std] SET  READ_WRITE 
GO
