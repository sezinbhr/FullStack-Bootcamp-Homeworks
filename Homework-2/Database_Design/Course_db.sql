USE [master]
GO
/****** Object:  Database [Course]    Script Date: 12.06.2021 21:58:58 ******/
CREATE DATABASE [Course]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Course', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Course.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Course_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Course_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Course] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Course].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Course] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Course] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Course] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Course] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Course] SET ARITHABORT OFF 
GO
ALTER DATABASE [Course] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Course] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Course] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Course] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Course] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Course] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Course] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Course] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Course] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Course] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Course] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Course] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Course] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Course] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Course] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Course] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Course] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Course] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Course] SET  MULTI_USER 
GO
ALTER DATABASE [Course] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Course] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Course] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Course] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Course] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Course] SET QUERY_STORE = OFF
GO
USE [Course]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_name] [varchar](50) NULL,
	[Course_number] [varchar](50) NOT NULL,
	[Credit_hours] [int] NULL,
	[Department_number] [varchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_number] [varchar](50) NOT NULL,
	[Department_name] [varchar](20) NULL,
	[Chair] [varchar](50) NULL,
 CONSTRAINT [PK__Departme__DAA60E683F3302D0] PRIMARY KEY CLUSTERED 
(
	[Department_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade_Report]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade_Report](
	[Student_number] [int] NOT NULL,
	[Section_identifier] [int] NOT NULL,
	[Grade] [varchar](10) NULL,
 CONSTRAINT [PK_GradeReport] PRIMARY KEY CLUSTERED 
(
	[Student_number] ASC,
	[Section_identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Instructor_name] [varchar](50) NOT NULL,
	[Office_number] [varchar](50) NULL,
	[E_mail] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Instructor_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prerequisite]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prerequisite](
	[Course_number] [varchar](50) NOT NULL,
	[Prerequisite_number] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prerequisite] PRIMARY KEY CLUSTERED 
(
	[Course_number] ASC,
	[Prerequisite_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[Section_identifier] [int] NOT NULL,
	[Course_number] [varchar](50) NULL,
	[Semester] [varchar](50) NULL,
	[Year] [int] NULL,
	[Instructor_name] [varchar](50) NULL,
 CONSTRAINT [PK_Section_İde] PRIMARY KEY CLUSTERED 
(
	[Section_identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12.06.2021 21:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Name] [varchar](50) NULL,
	[Student_number] [int] NOT NULL,
	[Class] [int] NULL,
	[Major] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__Dept_num__73BA3083] FOREIGN KEY([Department_number])
REFERENCES [dbo].[Department] ([Department_number])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__Dept_num__73BA3083]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([Chair])
REFERENCES [dbo].[Instructor] ([Instructor_name])
GO
ALTER TABLE [dbo].[Grade_Report]  WITH CHECK ADD  CONSTRAINT [FK_Report] FOREIGN KEY([Student_number])
REFERENCES [dbo].[Student] ([Student_number])
GO
ALTER TABLE [dbo].[Grade_Report] CHECK CONSTRAINT [FK_Report]
GO
ALTER TABLE [dbo].[Grade_Report]  WITH CHECK ADD  CONSTRAINT [FK_Report1] FOREIGN KEY([Section_identifier])
REFERENCES [dbo].[Section] ([Section_identifier])
GO
ALTER TABLE [dbo].[Grade_Report] CHECK CONSTRAINT [FK_Report1]
GO
ALTER TABLE [dbo].[Prerequisite]  WITH CHECK ADD  CONSTRAINT [FK_CourseNum] FOREIGN KEY([Course_number])
REFERENCES [dbo].[Course] ([Course_number])
GO
ALTER TABLE [dbo].[Prerequisite] CHECK CONSTRAINT [FK_CourseNum]
GO
ALTER TABLE [dbo].[Prerequisite]  WITH CHECK ADD  CONSTRAINT [FK_CourseNum1] FOREIGN KEY([Prerequisite_number])
REFERENCES [dbo].[Course] ([Course_number])
GO
ALTER TABLE [dbo].[Prerequisite] CHECK CONSTRAINT [FK_CourseNum1]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD FOREIGN KEY([Instructor_name])
REFERENCES [dbo].[Instructor] ([Instructor_name])
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_TakingCourse] FOREIGN KEY([Course_number])
REFERENCES [dbo].[Course] ([Course_number])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_TakingCourse]
GO
USE [master]
GO
ALTER DATABASE [Course] SET  READ_WRITE 
GO
