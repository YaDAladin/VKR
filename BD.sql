USE [master]
GO
/****** Object:  Database [18ip6]    Script Date: 07.06.2022 14:59:48 ******/
CREATE DATABASE [18ip6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'18ip6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\18ip6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'18ip6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\18ip6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [18ip6] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [18ip6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [18ip6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [18ip6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [18ip6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [18ip6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [18ip6] SET ARITHABORT OFF 
GO
ALTER DATABASE [18ip6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [18ip6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [18ip6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [18ip6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [18ip6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [18ip6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [18ip6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [18ip6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [18ip6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [18ip6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [18ip6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [18ip6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [18ip6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [18ip6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [18ip6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [18ip6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [18ip6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [18ip6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [18ip6] SET  MULTI_USER 
GO
ALTER DATABASE [18ip6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [18ip6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [18ip6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [18ip6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [18ip6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [18ip6] SET QUERY_STORE = OFF
GO
USE [18ip6]
GO
/****** Object:  User [YXMT\Преподаватели ЯПЭК]    Script Date: 07.06.2022 14:59:49 ******/
CREATE USER [YXMT\Преподаватели ЯПЭК] FOR LOGIN [YXMT\Преподаватели ЯПЭК]
GO
ALTER ROLE [db_datareader] ADD MEMBER [YXMT\Преподаватели ЯПЭК]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [YXMT\Преподаватели ЯПЭК]
GO
/****** Object:  View [dbo].[DemoExam]    Script Date: 07.06.2022 14:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DemoExam]
AS
SELECT        ProductTypeID AS Expr1, ArticleNumber AS Expr2, Image AS Expr3, Description AS Expr4, MinCostForAgent AS Expr5, ProductionWorkshopNumber AS Expr6, ProductionPersonCount AS Expr7, Title AS Expr8, dbo.Product.*, 
                         ID AS Expr9
FROM            dbo.Product
GO
/****** Object:  Table [dbo].[Category_tovarov]    Script Date: 07.06.2022 14:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_tovarov](
	[ID_Category] [int] IDENTITY(1,1) NOT NULL,
	[Naimenovanie] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category_tovarov] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dolzhnost]    Script Date: 07.06.2022 14:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dolzhnost](
	[ID_Dolzhnosti] [int] NOT NULL,
	[Dolzhnost] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dolzhnost] PRIMARY KEY CLUSTERED 
(
	[ID_Dolzhnosti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarizacia]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarizacia](
	[ID_Inventarizacii] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ID_Sotrudnika] [int] NULL,
 CONSTRAINT [PK_Inventarizacia] PRIMARY KEY CLUSTERED 
(
	[ID_Inventarizacii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invetarizacia_Tovar]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invetarizacia_Tovar](
	[ID_Inventarizacii] [int] NOT NULL,
	[ID_Tovar] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Invetarizacia_Tovar] PRIMARY KEY CLUSTERED 
(
	[ID_Inventarizacii] ASC,
	[ID_Tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavki]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavki](
	[ID_Postavki] [int] NOT NULL,
	[Date_postavki] [datetime] NOT NULL,
	[ID_Postavshika] [int] NULL,
 CONSTRAINT [PK_Postavki_1] PRIMARY KEY CLUSTERED 
(
	[ID_Postavki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavki_Tovar]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavki_Tovar](
	[ID_Postavki] [int] NOT NULL,
	[ID_Tovata] [int] NOT NULL,
	[Amount] [nvarchar](max) NULL,
 CONSTRAINT [PK_Postavki_Tovar] PRIMARY KEY CLUSTERED 
(
	[ID_Postavki] ASC,
	[ID_Tovata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavshik]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavshik](
	[ID_Postavshika] [int] NOT NULL,
	[Contact_data] [nvarchar](max) NULL,
	[Name_postavshika] [nvarchar](max) NULL,
 CONSTRAINT [PK_Postavshik] PRIMARY KEY CLUSTERED 
(
	[ID_Postavshika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnik]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnik](
	[ID_Sotrudnika] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NOT NULL,
	[Contact_data] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NULL,
	[ID_Dolzhnosti] [int] NULL,
	[Login] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sotrudnik] PRIMARY KEY CLUSTERED 
(
	[ID_Sotrudnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tovar]    Script Date: 07.06.2022 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tovar](
	[ID_Tovar] [int] NOT NULL,
	[Naimenovanie_tovara] [nvarchar](max) NULL,
	[ID_Category] [int] NULL,
	[Srok_godnosti] [datetime] NULL,
 CONSTRAINT [PK_Tovar] PRIMARY KEY CLUSTERED 
(
	[ID_Tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventarizacia]  WITH CHECK ADD  CONSTRAINT [FK_Inventarizacia_Sotrudnik1] FOREIGN KEY([ID_Sotrudnika])
REFERENCES [dbo].[Sotrudnik] ([ID_Sotrudnika])
GO
ALTER TABLE [dbo].[Inventarizacia] CHECK CONSTRAINT [FK_Inventarizacia_Sotrudnik1]
GO
ALTER TABLE [dbo].[Invetarizacia_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Invetarizacia_Tovar_Inventarizacia] FOREIGN KEY([ID_Inventarizacii])
REFERENCES [dbo].[Inventarizacia] ([ID_Inventarizacii])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invetarizacia_Tovar] CHECK CONSTRAINT [FK_Invetarizacia_Tovar_Inventarizacia]
GO
ALTER TABLE [dbo].[Invetarizacia_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Invetarizacia_Tovar_Tovar] FOREIGN KEY([ID_Tovar])
REFERENCES [dbo].[Tovar] ([ID_Tovar])
GO
ALTER TABLE [dbo].[Invetarizacia_Tovar] CHECK CONSTRAINT [FK_Invetarizacia_Tovar_Tovar]
GO
ALTER TABLE [dbo].[Postavki]  WITH CHECK ADD  CONSTRAINT [FK_Postavki_Postavshik] FOREIGN KEY([ID_Postavshika])
REFERENCES [dbo].[Postavshik] ([ID_Postavshika])
GO
ALTER TABLE [dbo].[Postavki] CHECK CONSTRAINT [FK_Postavki_Postavshik]
GO
ALTER TABLE [dbo].[Postavki_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Postavki_Tovar_Postavki] FOREIGN KEY([ID_Postavki])
REFERENCES [dbo].[Postavki] ([ID_Postavki])
GO
ALTER TABLE [dbo].[Postavki_Tovar] CHECK CONSTRAINT [FK_Postavki_Tovar_Postavki]
GO
ALTER TABLE [dbo].[Postavki_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Postavki_Tovar_Tovar] FOREIGN KEY([ID_Tovata])
REFERENCES [dbo].[Tovar] ([ID_Tovar])
GO
ALTER TABLE [dbo].[Postavki_Tovar] CHECK CONSTRAINT [FK_Postavki_Tovar_Tovar]
GO
ALTER TABLE [dbo].[Sotrudnik]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudnik_Dolzhnost] FOREIGN KEY([ID_Dolzhnosti])
REFERENCES [dbo].[Dolzhnost] ([ID_Dolzhnosti])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sotrudnik] CHECK CONSTRAINT [FK_Sotrudnik_Dolzhnost]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Category_tovarov] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Category_tovarov] ([ID_Category])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Category_tovarov]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 234
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1485
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DemoExam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DemoExam'
GO
USE [master]
GO
ALTER DATABASE [18ip6] SET  READ_WRITE 
GO
