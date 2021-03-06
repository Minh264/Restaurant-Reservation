USE [QLNhaHang]
GO
/****** Object:  Table [dbo].[DatBan]    Script Date: 1/6/2021 1:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatBan](
	[MaBK] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[Email] [nchar](50) NULL,
	[ThoiGian] [date] NULL,
	[MaNH] [int] NULL,
 CONSTRAINT [PK_DatBan] PRIMARY KEY CLUSTERED 
(
	[MaBK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 1/6/2021 1:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Users] [nchar](50) NOT NULL,
	[Password] [nchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaHang]    Script Date: 1/6/2021 1:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaHang](
	[MaNH] [int] IDENTITY(1,1) NOT NULL,
	[TenNH] [nchar](100) NULL,
	[Diachi] [nchar](100) NULL,
	[SDT] [nchar](10) NULL,
	[Gia] [int] NULL,
	[Soban] [int] NULL,
	[Images] [nchar](100) NULL,
 CONSTRAINT [PK_NhaHang] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
