USE [master]
GO
/****** Object:  Database [Vdovin-ses2]    Script Date: 21.12.2021 11:53:44 ******/
CREATE DATABASE [Vdovin-ses2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vdovin-ses2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vdovin-ses2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vdovin-ses2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vdovin-ses2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vdovin-ses2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vdovin-ses2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vdovin-ses2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vdovin-ses2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vdovin-ses2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vdovin-ses2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vdovin-ses2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET RECOVERY FULL 
GO
ALTER DATABASE [Vdovin-ses2] SET  MULTI_USER 
GO
ALTER DATABASE [Vdovin-ses2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vdovin-ses2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vdovin-ses2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vdovin-ses2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vdovin-ses2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vdovin-ses2', N'ON'
GO
ALTER DATABASE [Vdovin-ses2] SET QUERY_STORE = OFF
GO
USE [Vdovin-ses2]
GO
/****** Object:  Table [dbo].[Абоненты]    Script Date: 21.12.2021 11:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абоненты](
	[Номер_абонента] [int] NOT NULL,
	[idТелефонаАбонента] [int] NULL,
	[ФИО_абонента] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
 CONSTRAINT [PK_Абоненты] PRIMARY KEY CLUSTERED 
(
	[Номер_абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Города]    Script Date: 21.12.2021 11:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Города](
	[Код_города] [int] NOT NULL,
	[Название_города] [nvarchar](50) NULL,
	[idТарифа] [int] NULL,
 CONSTRAINT [PK_Города] PRIMARY KEY CLUSTERED 
(
	[Код_города] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговры]    Script Date: 21.12.2021 11:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговры](
	[Номер_разговора] [int] NOT NULL,
	[idТелефонаАбонента] [int] NULL,
	[Код_города] [int] NULL,
	[Дата_разговора] [date] NULL,
	[Время_разговора] [int] NULL,
	[Оплата] [nvarchar](50) NULL,
 CONSTRAINT [PK_Разговры] PRIMARY KEY CLUSTERED 
(
	[Номер_разговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тарифы]    Script Date: 21.12.2021 11:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тарифы](
	[idТарифа] [int] NOT NULL,
	[Тариф] [int] NULL,
 CONSTRAINT [PK_Тарифы] PRIMARY KEY CLUSTERED 
(
	[idТарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТелефоныАбонентов]    Script Date: 21.12.2021 11:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТелефоныАбонентов](
	[idТелефонаАбонента] [int] NOT NULL,
	[idАбонента] [int] NOT NULL,
	[Номер_телефона] [nchar](10) NOT NULL,
	[Номер_договора] [nvarchar](50) NOT NULL,
	[Дата_установки_телефона] [date] NOT NULL,
 CONSTRAINT [PK_ТелефоныАбонентов] PRIMARY KEY CLUSTERED 
(
	[idТелефонаАбонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'стоимость 1мин' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Тарифы', @level2type=N'COLUMN',@level2name=N'Тариф'
GO
USE [master]
GO
ALTER DATABASE [Vdovin-ses2] SET  READ_WRITE 
GO
