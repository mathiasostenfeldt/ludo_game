USE [master]
GO
/****** Object:  Database [RAC]    Script Date: 25-09-2017 09:01:47 ******/
CREATE DATABASE [RAC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RAC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RAC.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RAC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RAC_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RAC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RAC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RAC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RAC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RAC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RAC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RAC] SET ARITHABORT OFF 
GO
ALTER DATABASE [RAC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RAC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RAC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RAC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RAC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RAC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RAC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RAC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RAC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RAC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RAC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RAC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RAC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RAC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RAC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RAC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RAC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RAC] SET RECOVERY FULL 
GO
ALTER DATABASE [RAC] SET  MULTI_USER 
GO
ALTER DATABASE [RAC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RAC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RAC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RAC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RAC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RAC', N'ON'
GO
USE [RAC]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brand](
	[brandid] [int] IDENTITY(1,1) NOT NULL,
	[brandname] [varchar](50) NULL,
	[brandgroup] [varchar](50) NULL,
	[country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[brandid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[car]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[car](
	[carid] [int] IDENTITY(1,1) NOT NULL,
	[modelid] [int] NULL,
	[chassisnumber] [varchar](50) NULL,
	[licenseplate] [varchar](50) NULL,
	[mileage] [decimal](18, 0) NULL,
	[color] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[carid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carmodel]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carmodel](
	[modelid] [int] IDENTITY(1,1) NOT NULL,
	[brandid] [int] NOT NULL,
	[modelname] [varchar](50) NULL,
	[modeltype] [varchar](50) NULL,
	[fueltype] [varchar](50) NULL,
	[horesepower] [decimal](18, 0) NULL,
	[enginesize] [decimal](18, 0) NULL,
	[doors] [int] NULL,
	[fuelefficiency] [decimal](18, 0) NULL,
	[price] [decimal](18, 0) NULL,
	[seats] [int] NULL,
	[prodyear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[modelid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[zipcode] [int] NOT NULL,
	[cityname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[cusid] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[phonenumber] [varchar](25) NULL,
	[personnumber] [varchar](50) NULL,
	[streetname] [varchar](50) NULL,
	[housenumber] [int] NULL,
	[houseletter] [varchar](10) NULL,
	[housefloor] [varchar](10) NULL,
	[doorplacement] [varchar](10) NULL,
	[zipcode] [int] NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[driver]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[driver](
	[driverid] [int] IDENTITY(1,1) NOT NULL,
	[cusid] [int] NULL,
	[driverlicense] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[driverid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[driver_rent]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver_rent](
	[rentid] [int] NULL,
	[driverid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rentorder]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentorder](
	[rentid] [int] IDENTITY(1,1) NOT NULL,
	[cusid] [int] NULL,
	[carid] [int] NULL,
	[rentdate] [bigint] NULL,
	[estreturndate] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[rentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rentreciept]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rentreciept](
	[rentrecieptit] [int] IDENTITY(1,1) NOT NULL,
	[rentid] [int] NULL,
	[paymethod] [varchar](50) NULL,
	[discount] [decimal](18, 0) NULL,
	[total] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[rentrecieptit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[carsolderthantwoyears]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[carsolderthantwoyears]
AS
SELECT        dbo.brand.brandname, dbo.carmodel.modelname, dbo.carmodel.prodyear
FROM            dbo.carmodel INNER JOIN
                         dbo.brand ON dbo.brand.brandid = dbo.carmodel.brandid
WHERE        (dbo.carmodel.prodyear < FORMAT(DATEADD(yy, - 2, GETDATE()), 'yyyy'))
GROUP BY dbo.carmodel.prodyear, dbo.brand.brandname, dbo.carmodel.modelname

GO
/****** Object:  View [dbo].[orderuser]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select driver.cusid, customer.firstname, customer.lastname 
from driver left join customer on customer.cusid = driver.cusid 
where driver.cusid in(select rentorder.cusid from rentorder 
left join car on rentorder.carid = car.carid 
left join carmodel on carmodel.modelid = car.modelid 
left join brand on brand.brandid = carmodel.brandid  where brand.brandname = 'BMW' )



-- select COUNT(seats) as 'Seat count', UPPER(carmodel.modelname) as 'Modelname'  from carmodel where seats > 4 group by modelname


-- select COUNT(carid) as 'Count', brand.brandname from car join carmodel on car.modelid = carmodel.modelid join brand on brand.brandid = carmodel.brandid where brandname in (select brandname from brand) group by brandname

-- select COUNT(brand.brandname), brandname from brand where brandname in(select brandname from brand) group by brandname


select top 1 rentorder.carid, brand.brandname, UPPER(carmodel.modelname) as 'model' from rentorder left join car on car.carid = rentorder.carid left join carmodel on car.modelid = carmodel.modelid left join brand on carmodel.brandid = brand.brandid group by modelname, rentorder.carid, brand.brandname order by COUNT(rentorder.carid)
*/
CREATE VIEW [dbo].[orderuser]
AS
SELECT        dbo.rentorder.rentid, dbo.customer.cusid, dbo.customer.firstname, dbo.customer.lastname, dbo.brand.brandname, dbo.carmodel.modelname
FROM            dbo.rentorder LEFT OUTER JOIN
                         dbo.car ON dbo.car.carid = dbo.rentorder.carid LEFT OUTER JOIN
                         dbo.carmodel ON dbo.carmodel.modelid = dbo.car.modelid LEFT OUTER JOIN
                         dbo.brand ON dbo.brand.brandid = dbo.carmodel.brandid LEFT OUTER JOIN
                         dbo.customer ON dbo.customer.cusid = dbo.rentorder.cusid

GO
/****** Object:  View [dbo].[printreciept]    Script Date: 25-09-2017 09:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[printreciept] AS
SELECT customer.firstname, customer.lastname, customer.streetname, customer.housenumber, customer.houseletter, customer.housefloor, customer.doorplacement,
		city.zipcode, city.cityname, 
		brand.brandname, 
		carmodel.modelname, 
		rentorder.estreturndate, rentorder.rentdate, 
		rentreciept.total, rentreciept.discount, rentreciept.rentrecieptit 
FROM rentorder 
LEFT JOIN customer ON customer.cusid=rentorder.cusid 
LEFT JOIN city ON city.zipcode=customer.zipcode 
LEFT JOIN rentreciept ON rentreciept.rentid = rentorder.rentid 
LEFT JOIN car ON car.carid = rentorder.carid 
LEFT JOIN carmodel ON carmodel.modelid = car.modelid 
LEFT JOIN brand ON brand.brandid = carmodel.brandid
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD FOREIGN KEY([modelid])
REFERENCES [dbo].[carmodel] ([modelid])
GO
ALTER TABLE [dbo].[carmodel]  WITH CHECK ADD FOREIGN KEY([brandid])
REFERENCES [dbo].[brand] ([brandid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([zipcode])
REFERENCES [dbo].[city] ([zipcode])
GO
ALTER TABLE [dbo].[driver]  WITH CHECK ADD FOREIGN KEY([cusid])
REFERENCES [dbo].[customer] ([cusid])
GO
ALTER TABLE [dbo].[driver_rent]  WITH CHECK ADD FOREIGN KEY([driverid])
REFERENCES [dbo].[driver] ([driverid])
GO
ALTER TABLE [dbo].[driver_rent]  WITH CHECK ADD FOREIGN KEY([rentid])
REFERENCES [dbo].[rentorder] ([rentid])
GO
ALTER TABLE [dbo].[rentorder]  WITH CHECK ADD FOREIGN KEY([carid])
REFERENCES [dbo].[car] ([carid])
GO
ALTER TABLE [dbo].[rentorder]  WITH CHECK ADD FOREIGN KEY([cusid])
REFERENCES [dbo].[customer] ([cusid])
GO
ALTER TABLE [dbo].[rentreciept]  WITH CHECK ADD FOREIGN KEY([rentid])
REFERENCES [dbo].[rentorder] ([rentid])
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
         Begin Table = "carmodel"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "brand"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'carsolderthantwoyears'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'carsolderthantwoyears'
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "rentorder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "car"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "carmodel"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "brand"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "customer"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
         Or = 135' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orderuser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orderuser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orderuser'
GO
USE [master]
GO
ALTER DATABASE [RAC] SET  READ_WRITE 
GO
