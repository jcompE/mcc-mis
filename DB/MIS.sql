USE [master]
GO
/****** Object:  Database [MIS]    Script Date: 1/13/2018 8:14:55 PM ******/
CREATE DATABASE [MIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MIS', FILENAME = N'D:\MIS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MIS_log', FILENAME = N'D:\MIS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MIS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MIS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MIS] SET  MULTI_USER 
GO
ALTER DATABASE [MIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MIS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MIS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MIS', N'ON'
GO
USE [MIS]
GO
/****** Object:  User [administrator]    Script Date: 1/13/2018 8:14:55 PM ******/
CREATE USER [administrator] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [administrator]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/13/2018 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](50) NULL,
	[CourseDescript] [nvarchar](max) NULL,
	[CourseUnits] [float] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/13/2018 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](20) NULL,
	[DepartmentName] [nvarchar](30) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 1/13/2018 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](max) NULL,
	[PaymentFee] [float] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Payment__9B556A3845628934] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Program]    Script Date: 1/13/2018 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[ProgId] [int] IDENTITY(1,1) NOT NULL,
	[ProgCode] [nvarchar](50) NULL,
	[ProgDescript] [nvarchar](max) NULL,
	[ProgMajor] [nvarchar](100) NULL,
	[Credit] [nvarchar](50) NULL,
	[DepartmentID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/13/2018 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudId] [nvarchar](50) NOT NULL,
	[StudLname] [nvarchar](max) NULL,
	[StudFname] [nvarchar](max) NULL,
	[StudMname] [nvarchar](max) NULL,
	[StudBdate] [date] NULL,
	[BirthPlace] [nvarchar](max) NULL,
	[StudGender] [nvarchar](5) NULL,
	[StudCivilStats] [nvarchar](20) NULL,
	[ProgId] [int] NULL,
	[StudYearLevel] [nvarchar](10) NULL,
	[StudReligion] [nvarchar](max) NULL,
	[StudAddress] [nvarchar](max) NULL,
	[StudParent] [nvarchar](max) NULL,
	[DateRegister] [date] NULL,
	[StudParConNo] [nvarchar](13) NULL,
 CONSTRAINT [PK_Fname] PRIMARY KEY CLUSTERED 
(
	[StudId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseDescript], [CourseUnits], [IsActive]) VALUES (2, N'Math5', N'Geometry', 3, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName], [IsActive]) VALUES (1, N'SOT', N'School of Technology', 1)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName], [IsActive]) VALUES (2, N'SOE', N'School of Education', 1)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName], [IsActive]) VALUES (3, N'SOB', N'School of Business', 1)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentCode], [DepartmentName], [IsActive]) VALUES (4, N'SAS', N'School of Arts and Sciences', 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [PaymentName], [PaymentFee], [IsActive]) VALUES (1, N'Computer Laboratory', 200, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([ProgId], [ProgCode], [ProgDescript], [ProgMajor], [Credit], [DepartmentID], [IsActive]) VALUES (1, N'BS Info-Tech', N'Bachelor of Science  Information Technology', NULL, N'4yrs', 1, 1)
SET IDENTITY_INSERT [dbo].[Program] OFF
USE [master]
GO
ALTER DATABASE [MIS] SET  READ_WRITE 
GO