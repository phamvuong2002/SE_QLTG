USE [master]
GO

--drop database QLTG
--go

/****** Object:  Database [QLTG]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE DATABASE [QLTG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTG_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLTG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTG] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTG] SET  MULTI_USER 
GO
ALTER DATABASE [QLTG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTG', N'ON'
GO
ALTER DATABASE [QLTG] SET QUERY_STORE = OFF
GO
USE [QLTG]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[ADMINID] [char](10) NOT NULL,
	[PASSWORD] [char](20) NOT NULL,
	[ADMINNAME] [nchar](30) NOT NULL,
	[EMAIL] [char](50) NULL,
	[PHONENUMBER] [char](15) NULL,
	[AVATAR] [varchar](50) NULL,
	[USERNAME] [char](20) NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[ADMINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTHOR]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHOR](
	[AUTHORID] [char](10) NOT NULL,
	[ADMINID] [char](10) NOT NULL,
	[EDITORID] [char](10) NOT NULL,
	[PASSWORD] [char](15) NOT NULL,
	[AUTHORNAME] [nchar](50) NOT NULL,
	[EMAIL] [char](30) NOT NULL,
	[ADDRESS] [nchar](30) NOT NULL,
	[PHONENUMBER] [char](15) NOT NULL,
	[USERNAME] [char](20) NOT NULL,
	[SALARY] [float] NULL,
	[AVATAR] [char](50) NULL,
 CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED 
(
	[AUTHORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAPTER]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAPTER](
	[CHAPTERID] [char](10) NOT NULL,
	[EDITORID] [char](10) NOT NULL,
	[OUTLINEID] [char](10) NOT NULL,
	[STORYID] [char](10) NOT NULL,
	[AUTHORID] [char](10) NOT NULL,
	[CHAPTERNAME] [nchar](30) NOT NULL,
	[GIA] [float] NULL,
	[CONTENT] [text] NULL,
	[UNPAIR] [float] NULL,
 CONSTRAINT [PK_CHAPTER] PRIMARY KEY CLUSTERED 
(
	[CHAPTERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[COMMENTID] [char](10) NOT NULL,
	[CHAPTERID] [char](10) NOT NULL,
	[EDITORID] [char](10) NULL,
	[CONTENT] [text] NULL,
 CONSTRAINT [PK_COMMENT] PRIMARY KEY CLUSTERED 
(
	[COMMENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRAFT]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRAFT](
	[DRAFTID] [char](10) NOT NULL,
	[AUTHORID] [char](10) NOT NULL,
	[STORYID] [char](10) NOT NULL,
	[EDITORID] [char](10) NOT NULL,
	[CONTENT] [text] NOT NULL,
	[GIA] [float] NULL,
	[UNPAIR] [float] NULL,
 CONSTRAINT [PK_DRAFT] PRIMARY KEY CLUSTERED 
(
	[DRAFTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EDITOR]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDITOR](
	[EDITORID] [char](10) NOT NULL,
	[ADMINID] [char](10) NOT NULL,
	[EDITORNAME] [nchar](30) NOT NULL,
	[EMAIL] [char](30) NOT NULL,
	[PHONENUMBER] [char](15) NULL,
	[USERNAME] [char](20) NOT NULL,
	[SALARY] [float] NULL,
	[PASSWORD] [char](20) NULL,
	[AVATAR] [char](50) NULL,
 CONSTRAINT [PK_EDITOR] PRIMARY KEY CLUSTERED 
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUTLINE]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUTLINE](
	[OUTLINEID] [char](10) NOT NULL,
	[AUTHORID] [char](10) NOT NULL,
	[EDITORID] [char](10) NOT NULL,
	[STORYID] [char](10) NOT NULL,
	[CONTENT] [text] NULL,
	[GIA] [float] NULL,
	[UNPAIR] [float] NULL,
 CONSTRAINT [PK_OUTLINE] PRIMARY KEY CLUSTERED 
(
	[OUTLINEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STORY]    Script Date: 12/31/2022 5:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STORY](
	[STORYID] [char](10) NOT NULL,
	[AUTHORID] [char](10) NOT NULL,
	[EDITORID] [char](10) NULL,
	[STORYNAME] [nchar](30) NOT NULL,
	[STATE] [nchar](20) NOT NULL,
	[NUMOFCHAPS] [int] NOT NULL,
	[TYPE] [char](10) NOT NULL,
	[AVATAR] [varchar](50) NULL,
 CONSTRAINT [PK_STORY] PRIMARY KEY CLUSTERED 
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD174920  ', N'8CI6COE5            ', N'Olivia Stokes                 ', N'xttoqfu10@ehw.net                                 ', N'271026-4065    ', N'link', N'Jennifer386         ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD307730  ', N'36FYERY4            ', N'Wendi Ross                    ', N'fbrwrwli9@tlt.net                                 ', N'893056-4267    ', N'link', N'Felipe387           ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD328644  ', N'3BJBZVS7            ', N'Felix Lawson                  ', N'euxyow@jnl.com                                    ', N'024-630-1311   ', N'link', N'Kerry725            ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD342720  ', N'9ZODFOOH            ', N'Marjorie Perez                ', N'wdia@lhj.org                                      ', N'494869-9600    ', N'link', N'Bryon50             ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD522737  ', N'Y3ZHN147            ', N'Alisa Santos                  ', N'tipqmbi@sco.com                                   ', N'090-3759879    ', N'link', N'Nicole817           ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD790170  ', N'S6SBTVKP            ', N'Tricia Ingram                 ', N'tpdoo@nfq.org                                     ', N'6555533139     ', N'link', N'Regina200           ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD808006  ', N'P0ZTU2II            ', N'Shane Anderson                ', N'attndcc@ygn.net                                   ', N'571-6254452    ', N'link', N'Sally229            ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD871991  ', N'83GRNFCX            ', N'Regina Mc Gee                 ', N'ttss42@yrh.com                                    ', N'954-6445357    ', N'link', N'Manuel292           ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD936223  ', N'AMPPY35D            ', N'Jolene Nunez                  ', N'dwcigdf061@mvk.org                                ', N'590-310-8470   ', N'link', N'Bret897             ')
INSERT [dbo].[ADMIN] ([ADMINID], [PASSWORD], [ADMINNAME], [EMAIL], [PHONENUMBER], [AVATAR], [USERNAME]) VALUES (N'AD986496  ', N'3N18BZON            ', N'Dewayne Forbes                ', N'zhbfy365@ryn.net                                  ', N'547864-3163    ', N'link', N'Jaime475            ')
GO
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU0147388 ', N'AD936223  ', N'ED408053  ', N'ZW9NRUEKQ      ', N'Albert Holder                                     ', N'kznto@noj.com                 ', N'After Sales Group             ', N'225-872-7635   ', N'Aimee893            ', 1878.1359951841348, N'avatar_vio_6.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU0886539 ', N'AD342720  ', N'ED949502  ', N'F3F5N88ZW      ', N'Jeanette Osborn                                   ', N'xicv@gok.net                  ', N'6th Floor                     ', N'147-186-9316   ', N'Alfonso303          ', 579.63281733898111, N'avatar_vio_18.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU1173555 ', N'AD307730  ', N'ED478628  ', N'XGTTAZJ0Y      ', N'Robin Shelton                                     ', N'lcvnfwuu@ywe.com              ', N'Customer Group                ', N'657-375-6415   ', N'Jim161              ', 1181.9778923792662, N'avatar_vio_13.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2024405 ', N'AD342720  ', N'ED931645  ', N'OXVEYWLVU      ', N'Kyle Stewart                                      ', N'nxdgj@lyq.net                 ', N'After Sales Department        ', N'(323) 323-9290 ', N'Curtis673           ', 1001.812472474674, N'avatar_vio_13.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2078699 ', N'AD307730  ', N'ED478628  ', N'G5JLX6EEH      ', N'Melanie Morse                                     ', N'tucgwr@epm.org                ', N'Anthony Building              ', N'571-450-5762   ', N'Angie181            ', 639.93441715833478, N'avatar_vio_9.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2435624 ', N'AD522737  ', N'ED779066  ', N'ID1832F5B      ', N'Sarah Mckinney                                    ', N'dvhorlbm360@vur.net           ', N'Roosevelt Building            ', N'(447) 927-3180 ', N'Philip05            ', 1665.3519213038273, N'avatar_vio_2.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2481760 ', N'AD328644  ', N'ED295770  ', N'SXROD0U9B      ', N'Lena Powell                                       ', N'ivggjws61@hbe.net             ', N'Suite 9655                    ', N'(529) 750-2813 ', N'Kimberly08          ', 1909.7660050772902, N'avatar_vio_7.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2563038 ', N'AD342720  ', N'ED608689  ', N'7EWYF0PWQ      ', N'Bryce Marks                                       ', N'uaoyrkn@yvq.org               ', N'Einstein Building             ', N'(959) 168-1547 ', N'Holly95             ', 1839.8075349814294, N'avatar_vio_4.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2671764 ', N'AD342720  ', N'ED931645  ', N'F8U0WAF2M      ', N'Kerry Black                                       ', N'isasl@ukp.com                 ', N'Suite 4377                    ', N'128-866-1884   ', N'Betty664            ', 1918.0048564067133, N'avatar_vio_18.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU2765992 ', N'AD307730  ', N'ED478628  ', N'6IY4BEDZF      ', N'Robyn Hinton                                      ', N'kqsdljq@bcd.org               ', N'1st Floor                     ', N'(586) 156-1917 ', N'Mike094             ', 1461.3353698334356, N'avatar_vio_7.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU3240325 ', N'AD174920  ', N'ED524729  ', N'LNYTAZMCE      ', N'Kenny Fox                                         ', N'jzqc780@wei.net               ', N'Pre Sales Group               ', N'(627) 270-9160 ', N'Robert542           ', 1812.2604542003294, N'avatar_vio_15.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU3350395 ', N'AD790170  ', N'ED779066  ', N'UNXZWIKOA      ', N'Darlene Baker                                     ', N'xadbur521@suz.org             ', N'Pre Sales Group               ', N'(254) 690-0978 ', N'Marisol441          ', 1523.2489716835548, N'avatar_vio_13.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU3639829 ', N'AD808006  ', N'ED841430  ', N'3N1NF0P6D      ', N'Claire Chase                                      ', N'ymmatnu3@yhl.org              ', N'Appartment 18                 ', N'(472) 647-1895 ', N'Sherman676          ', 921.29053008802725, N'avatar_vio_13.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU3740895 ', N'AD790170  ', N'ED518373  ', N'QA73X1PHD      ', N'Harvey Mann                                       ', N'wnqlerxm@xtg.net              ', N'Appartment 792                ', N'(801) 316-4522 ', N'Joann309            ', 1386.2034975952486, N'avatar_vio_3.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU3958504 ', N'AD328644  ', N'ED536554  ', N'D6TCJF5CY      ', N'Kim Adams                                         ', N'tpegi26@hrr.com               ', N'1st Floor                     ', N'(704) 063-5621 ', N'Shelley937          ', 1901.5009281698153, N'avatar_vio_11.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4101314 ', N'AD342720  ', N'ED931645  ', N'OLCJD9HRH      ', N'Benny Strong                                      ', N'xiam@xst.net                  ', N'Suite 889                     ', N'(173) 827-7368 ', N'Keisha265           ', 1654.4043021995594, N'avatar_vio_3.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4134982 ', N'AD307730  ', N'ED841430  ', N'U8D8LIP9R      ', N'Erich Suarez                                      ', N'iqnkid@vlj.com                ', N'Roosevelt Building            ', N'(823) 549-1809 ', N'Jermaine274         ', 945.85297370602052, N'avatar_vio_19.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4351179 ', N'AD174920  ', N'ED536554  ', N'X1L7I63NK      ', N'Karrie Cantrell                                   ', N'qhdtgw@aui.net                ', N'Suite 135                     ', N'(229) 638-3187 ', N'Jackie339           ', 606.83937911262706, N'avatar_vio_5.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4541066 ', N'AD174920  ', N'ED536554  ', N'OTI0F2TW9      ', N'Francisco Meadows                                 ', N'taxp327@awt.net               ', N'8th Floor                     ', N'(142) 186-9104 ', N'Lucas703            ', 1613.96397399435, N'avatar_vio_11.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4582978 ', N'AD328644  ', N'ED295770  ', N'CBU58YQK5      ', N'Chris Russell                                     ', N'oobxlyg956@bge.org            ', N' Department                   ', N'687-070-9216   ', N'Dominick818         ', 1361.116809240131, N'avatar_vio_14.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU4804294 ', N'AD174920  ', N'ED524729  ', N'CR6F4S2AA      ', N'Liza Heath                                        ', N'ysuv6@lja.org                 ', N'9th Floor                     ', N'(722) 555-4205 ', N'Timothy6            ', 526.35072685142552, N'avatar_vio_17.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU5492956 ', N'AD307730  ', N'ED949502  ', N'HCNY0OCWB      ', N'Theresa Lawson                                    ', N'szugxhn@ejo.net               ', N'Appartment 242                ', N'(449) 521-9824 ', N'Alberto269          ', 740.67929281884767, N'avatar_vio_19.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU6330488 ', N'AD808006  ', N'ED841430  ', N'7T69Q9RAJ      ', N'Kelley Vega                                       ', N'nuyp@yyq.com                  ', N'Suite 2                       ', N'(170) 548-1901 ', N'Julio893            ', 608.260838132473, N'avatar_vio_9.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU6873987 ', N'AD522737  ', N'ED779066  ', N'DJ9GQZKWS      ', N'Jeff Espinoza                                     ', N'jthgngb3@tiv.com              ', N'APT 864                       ', N'(088) 907-3912 ', N'Michelle292         ', 790.38248317799639, N'avatar_vio_18.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU7631127 ', N'AD328644  ', N'ED295770  ', N'3PUA417C6      ', N'Meredith Davenport                                ', N'zcrbx20@lqa.org               ', N'APT 9                         ', N'(032) 348-5420 ', N'Xavier498           ', 1860.3778136243941, N'avatar_vio_17.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU7922632 ', N'AD936223  ', N'ED518373  ', N'076BYAQ89      ', N'Roxanne Ferguson                                  ', N'lzlpr@mld.org                 ', N'1st Floor                     ', N'(471) 841-9565 ', N'Daphne899           ', 567.0627293023573, N'avatar_vio_12.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU7947660 ', N'AD936223  ', N'ED408053  ', N'95MRV12O1      ', N'Stacey Rowe                                       ', N'taeuuyr3@vav.org              ', N'Lincoln Building              ', N'(466) 865-8338 ', N'Herman126           ', 1087.3892410133917, N'avatar_vio_1.jpg                                  ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU8484232 ', N'AD790170  ', N'ED518373  ', N'7QJHYQLZP      ', N'Floyd Ramirez                                     ', N'gtkh@leb.com                  ', N'Madison Building              ', N'325-727-5768   ', N'Shane135            ', 942.9786465796542, N'avatar_vio_18.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU8691099 ', N'AD790170  ', N'ED250938  ', N'TGLTET51G      ', N'Gary Guerrero                                     ', N'bpov@byo.net                  ', N'1st Floor                     ', N'(132) 381-1678 ', N'Kendra896           ', 1622.8935123062197, N'avatar_vio_17.jpg                                 ')
INSERT [dbo].[AUTHOR] ([AUTHORID], [ADMINID], [EDITORID], [PASSWORD], [AUTHORNAME], [EMAIL], [ADDRESS], [PHONENUMBER], [USERNAME], [SALARY], [AVATAR]) VALUES (N'AU9958083 ', N'AD936223  ', N'ED408053  ', N'HZ9TKTC2W      ', N'Angelique Madden                                  ', N'uubmcuy65@fmp.net             ', N'After Sales Group             ', N'(808) 640-9391 ', N'Nakia292            ', 1733.9252791059787, N'avatar_vio_9.jpg                                  ')
GO
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH00mcu55 ', N'ED359509  ', N'56327     ', N'ST690542  ', N'AU2435624 ', N'Doptinantor 2                 ', 1718.4010597730062, N'non quartu fecit. transit. si eggredior. essit. si', 865.77637338836018)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH02fok26 ', N'ED408053  ', N'42586     ', N'ST887428  ', N'AU4134982 ', N'Cipzapicator 2                ', 1004.2425041805219, N'eudis quo eudis et linguens quad vobis egreddior', 974.05342339258459)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH08agk27 ', N'ED524729  ', N'17368     ', N'ST001775  ', N'AU4351179 ', N'Lompickackin 1                ', 1782.2029777021162, N'gravum fecundio, quoque et pladior Id cognitio,', 940.50813980889484)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH08fkj68 ', N'ED250938  ', N'24879     ', N'ST517649  ', N'AU4101314 ', N'Gropebantor 5                 ', 468.24362970341167, N'dolorum cognitio, quad estis vantis. rarendum', 320.70409821890445)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH08pbt57 ', N'ED524729  ', N'45550     ', N'ST001775  ', N'AU4582978 ', N'Zeehupentor 8                 ', 614.93306495944637, N'plorum imaginator glavans novum bono si glavans Et', 446.06268131605441)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH09tow28 ', N'ED027100  ', N'15916     ', N'ST114044  ', N'AU3740895 ', N'Tipmunewex 2                  ', 234.39753753337894, N'si vantis. quad pladior quorum brevens, linguens', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH13jgy42 ', N'ED295770  ', N'19107     ', N'ST207750  ', N'AU3350395 ', N'Parfropazz 2                  ', 57.171049531163206, N'Id linguens fecit, regit, pars imaginator', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH13ufi91 ', N'ED249136  ', N'16706     ', N'ST613498  ', N'AU3240325 ', N'Varnipor 4                    ', 1007.3326280141868, N'Sed glavans Multum transit. gravis rarendum quad', 286.32172511852781)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH15kef20 ', N'ED779066  ', N'59400     ', N'ST382917  ', N'AU5492956 ', N'Monjubover 6                  ', 228.7221870751689, N'Sed homo, glavans plorum quis Multum quad fecit.', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH20bdo76 ', N'ED563342  ', N'22572     ', N'ST787374  ', N'AU6873987 ', N'Infropicar 8                  ', 763.96315184606385, N'et quad et Quad Versus gravum et transit. pars', 499.07610994404286)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH20zea77 ', N'ED408053  ', N'37462     ', N'ST887428  ', N'AU6873987 ', N'Cipfropin 1                   ', 1586.2852981715862, N'nomen gravum non non Id Tam in venit. vantis.', 1130.7374705491307)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH25aow98 ', N'ED931645  ', N'16706     ', N'ST188007  ', N'AU4804294 ', N'Undimicator 8                 ', 156.83094377481888, N'quo eggredior. in novum nomen travissimantor novum', 74.496071953539612)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH25ubr03 ', N'ED841430  ', N'10624     ', N'ST999614  ', N'AU6330488 ', N'Adcadazz 8                    ', 1479.3371628175196, N'Tam plurissimum pladior quis quartu si manifestum', 1110.9630358534344)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH30tpw11 ', N'ED949502  ', N'59400     ', N'ST437900  ', N'AU5492956 ', N'Monsapover 4                  ', 1462.5087235413998, N'Et imaginator nomen pladior quorum plurissimum et', 422.11357350808362)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH32vxu48 ', N'ED563342  ', N'89517     ', N'ST787374  ', N'AU7631127 ', N'Froglibazz 4                  ', 651.13960767683557, N'et nomen fecundio, glavans plorum Quad gravis', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH36flc52 ', N'ED779066  ', N'63016     ', N'ST382917  ', N'AU3240325 ', N'Varsapor 7                    ', 1808.7854475522347, N'brevens, pladior quis homo, brevens, parte Quad', 1727.5683419403033)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH36zek31 ', N'ED536554  ', N'17368     ', N'ST922132  ', N'AU3958504 ', N'Unvenentor 1                  ', 1267.1658902276149, N'quo e quo gravis quad nomen transit. in vobis in', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH37bua72 ', N'ED249136  ', N'56082     ', N'ST613498  ', N'AU2078699 ', N'Emsipor 5                     ', 556.60792650031294, N'fecit. quartu gravis transit. dolorum Tam', 474.26484141499321)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH37hzy84 ', N'ED931645  ', N'56327     ', N'ST188007  ', N'AU2563038 ', N'Hapfropex 5                   ', 1331.4112165623399, N'quis ut et quad eudis travissimantor e si', 1274.0682412752319)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH37ngp33 ', N'ED841430  ', N'70494     ', N'ST999614  ', N'AU2024405 ', N'Qwisipar 9                    ', 1550.7756785027568, N'manifestum brevens, Versus novum et Quad sed', 1250.0495329353955)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH47dax68 ', N'ED779066  ', N'10673     ', N'ST382917  ', N'AU2078699 ', N'Supquesticator 6              ', 1392.4950789392437, N'linguens linguens esset Quad brevens, essit.', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH47xgk13 ', N'ED518373  ', N'20859     ', N'ST497513  ', N'AU4351179 ', N'Surrobimar 8                  ', 1112.7104552289054, N'quad essit. quad si dolorum et funem. ut fecit.', 296.73940286457741)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH47zlc75 ', N'ED478628  ', N'59400     ', N'ST001978  ', N'AU5492956 ', N'Tippebefover 1                ', 974.23145874600459, N'plorum brevens, funem. fecundio, Longam, nomen', 174.749712566182)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH52xom29 ', N'ED295770  ', N'44536     ', N'ST207750  ', N'AU8691099 ', N'Ciptinopor 6                  ', 1198.6696023487809, N'trepicandor homo, gravis imaginator quantare parte', 55.208992786487805)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH53bla41 ', N'ED832567  ', N'47103     ', N'ST990067  ', N'AU3958504 ', N'Parsapex 9                    ', 737.5727940991394, N'regit, pladior Longam, novum vobis habitatio esset', 117.77564086659281)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH54dqz60 ', N'ED518373  ', N'20859     ', N'ST497513  ', N'AU4351179 ', N'Upvenadentor 5                ', 1941.3841971854606, N'quad Et non egreddior in Quad apparens parte', 1066.7943407047419)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH55ehh53 ', N'ED841430  ', N'11779     ', N'ST999614  ', N'AU2765992 ', N'Dopquestilentor 1             ', 1285.1694869972623, N'gravum quad nomen quad non quartu brevens, vobis', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH55lkk97 ', N'ED524729  ', N'35142     ', N'ST001775  ', N'AU7947660 ', N'Winnipentor 4                 ', 982.50149487634258, N'novum quad volcans Id et gravis vantis. et quad', 113.59095603636821)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH59hfs76 ', N'ED359509  ', N'44536     ', N'ST690542  ', N'AU8691099 ', N'Zeenipicicator 1              ', 946.74486666766222, N'quo novum funem. glavans trepicandor bono', 384.90415668556807)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH59qpq98 ', N'ED536554  ', N'19107     ', N'ST922132  ', N'AU3350395 ', N'Tuprobexover 8                ', 756.620524617201, N'parte estum. brevens, et sed linguens Id Versus', 588.94148863495661)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH60ekf63 ', N'ED249136  ', N'59400     ', N'ST613498  ', N'AU5492956 ', N'Cipwerupicator 7              ', 993.02869930073086, N'Longam, vobis e et gravis gravum e regit, novum', 585.46397195607358)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH67khb94 ', N'ED478628  ', N'19107     ', N'ST001978  ', N'AU3350395 ', N'Lomhuponin 3                  ', 595.52168005403212, N'in Multum quo gravis novum Multum apparens gravum', 270.68379793495825)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH72qwt70 ', N'ED359509  ', N'42586     ', N'ST690542  ', N'AU3639829 ', N'Supmunower 5                  ', 1569.5369933822828, N'quantare Et pars estis gravum Sed Multum venit.', 839.15378484779671)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH74tnu25 ', N'ED931645  ', N'56082     ', N'ST188007  ', N'AU2078699 ', N'Surglibax 5                   ', 1096.0008193021643, N'linguens Multum rarendum vobis et venit. estum.', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH75pnp89 ', N'ED949502  ', N'44536     ', N'ST437900  ', N'AU8691099 ', N'Vardimepicator 1              ', 1602.7615561395705, N'quantare novum estis brevens, estum. Versus', 102.36746165521721)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH75rnu90 ', N'ED295770  ', N'59400     ', N'ST207750  ', N'AU5492956 ', N'Surwerpplax 3                 ', 299.97721975668208, N'bono imaginator manifestum quo e fecit. non e', 29.629113028884202)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH75sdi01 ', N'ED608689  ', N'16706     ', N'ST463060  ', N'AU4804294 ', N'Adhupan 9                     ', 193.97812734543257, N'gravis essit. non vobis plorum in transit. glavans', 54.1081936876754)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH90jjh45 ', N'ED536554  ', N'41548     ', N'ST922132  ', N'AU0886539 ', N'Zeebanicator 4                ', 1787.9458481622608, N'dolorum quad quad vantis. eggredior. trepicandor', 360.56808899391024)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH91hbs23 ', N'ED027100  ', N'19964     ', N'ST114044  ', N'AU7922632 ', N'Varkilazz 1                   ', 400.17432833564203, N'quartu et quo e plorum non quorum vobis rarendum', 0)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH92bex81 ', N'ED785700  ', N'46832     ', N'ST470636  ', N'AU0886539 ', N'Ciptinommex 5                 ', 488.70827143020387, N'e ut vantis. gravis gravum si eudis trepicandor', 190.28364361162261)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH94cmb14 ', N'ED408053  ', N'10624     ', N'ST887428  ', N'AU6330488 ', N'Raptinplan 8                  ', 1023.3734846689615, N'vobis brevens, Longam, quis quo, Tam quantare Et', 347.93573541828658)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH94xtf74 ', N'ED518373  ', N'60888     ', N'ST497513  ', N'AU9958083 ', N'Winfropazz 1                  ', 1137.5981328951186, N'quo vobis gravum estis esset in parte et Quad e in', 380.271846548815)
INSERT [dbo].[CHAPTER] ([CHAPTERID], [EDITORID], [OUTLINEID], [STORYID], [AUTHORID], [CHAPTERNAME], [GIA], [CONTENT], [UNPAIR]) VALUES (N'CH97lxz15 ', N'ED478628  ', N'89164     ', N'ST001978  ', N'AU2024405 ', N'Lomdudor 2                    ', 595.80544330915689, N'quo imaginator vobis pladior egreddior nomen e et', 44.2540788046604)
GO
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM009767  ', N'CH92bex81 ', N'ED250938  ', N'non quo, imaginator')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM021068  ', N'CH67khb94 ', N'ED249136  ', N'et bono Quad plorum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM023848  ', N'CH02fok26 ', N'ED249136  ', N'volcans Pro pladior')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM034257  ', N'CH59qpq98 ', N'ED841430  ', N'quo, novum volcans')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM051857  ', N'CH47dax68 ', N'ED250938  ', N'vobis cognitio,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM052188  ', N'CH20bdo76 ', N'ED563342  ', N'vobis sed glavans')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM060159  ', N'CH55lkk97 ', N'ED563342  ', N'non esset quantare')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM075802  ', N'CH08agk27 ', N'ED250938  ', N'eudis Quad esset')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM075821  ', N'CH32vxu48 ', N'ED295770  ', N'novum quad quartu')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM076597  ', N'CH94cmb14 ', N'ED608689  ', N'vobis venit. non')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM089133  ', N'CH55ehh53 ', N'ED536554  ', N'ut et in brevens, in')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM114552  ', N'CH36flc52 ', N'ED563342  ', N'non trepicandor')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM132328  ', N'CH52xom29 ', N'ED359509  ', N'cognitio, funem.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM144780  ', N'CH15kef20 ', N'ED518373  ', N'in delerium. venit.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM171929  ', N'CH08fkj68 ', N'ED832567  ', N'eggredior. plorum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM189939  ', N'CH60ekf63 ', N'ED563342  ', N'dolorum quo estis')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM208564  ', N'CH08pbt57 ', N'ED250938  ', N'novum cognitio,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM211970  ', N'CH55lkk97 ', N'ED785700  ', N'eggredior. et')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM225632  ', N'CH97lxz15 ', N'ED249136  ', N'bono manifestum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM247151  ', N'CH20bdo76 ', N'ED931645  ', N'non eggredior. Sed')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM247666  ', N'CH20zea77 ', N'ED536554  ', N'fecit. manifestum ut')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM255320  ', N'CH32vxu48 ', N'ED563342  ', N'trepicandor pars')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM262599  ', N'CH91hbs23 ', N'ED524729  ', N'e plorum plurissimum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM293155  ', N'CH94xtf74 ', N'ED949502  ', N'parte et manifestum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM311436  ', N'CH02fok26 ', N'ED478628  ', N'Quad Versus plorum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM319030  ', N'CH20zea77 ', N'ED608689  ', N'rarendum gravum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM371739  ', N'CH94xtf74 ', N'ED359509  ', N'quoque si et gravis')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM373337  ', N'CH37bua72 ', N'ED608689  ', N'quoque glavans')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM374995  ', N'CH54dqz60 ', N'ED359509  ', N'transit. regit, bono')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM434326  ', N'CH75sdi01 ', N'ED832567  ', N'in ut homo, si')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM440093  ', N'CH94xtf74 ', N'ED841430  ', N'gravis quo apparens')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM442875  ', N'CH37hzy84 ', N'ED931645  ', N'novum plurissimum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM455997  ', N'CH25ubr03 ', N'ED250938  ', N'quoque esset novum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM458325  ', N'CH15kef20 ', N'ED563342  ', N'non parte Quad')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM467648  ', N'CH60ekf63 ', N'ED931645  ', N'non Tam non pars')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM470709  ', N'CH60ekf63 ', N'ED524729  ', N'non gravis gravum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM476675  ', N'CH47dax68 ', N'ED536554  ', N'non Et non estis')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM476736  ', N'CH75sdi01 ', NULL, N'trepicandor transit.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM487506  ', N'CH20zea77 ', N'ED841430  ', N'delerium. quad')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM507671  ', N'CH94xtf74 ', N'ED785700  ', N'Longam, quad non sed')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM520805  ', N'CH75pnp89 ', N'ED832567  ', N'eggredior. parte si')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM529141  ', N'CH08fkj68 ', N'ED478628  ', N'venit. quo, parte')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM533867  ', N'CH47xgk13 ', N'ED249136  ', N'si habitatio homo,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM600003  ', N'CH92bex81 ', N'ED250938  ', N'non Multum nomen')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM600629  ', N'CH13jgy42 ', N'ED536554  ', N'quo glavans ut quad')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM605590  ', N'CH75rnu90 ', N'ED841430  ', N'homo, plurissimum Et')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM614100  ', N'CH08fkj68 ', N'ED563342  ', N'si linguens gravum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM616105  ', N'CH36zek31 ', N'ED249136  ', N'transit. esset')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM616614  ', N'CH94xtf74 ', N'ED524729  ', N'parte vantis. fecit.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM617386  ', N'CH15kef20 ', N'ED931645  ', N'quartu esset nomen')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM639433  ', N'CH74tnu25 ', N'ED295770  ', N'non quorum novum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM642115  ', N'CH67khb94 ', N'ED785700  ', N'travissimantor')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM653304  ', N'CH08pbt57 ', N'ED949502  ', N'quad quoque novum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM659815  ', N'CH47zlc75 ', N'ED785700  ', N'quo, novum cognitio,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM667942  ', N'CH32vxu48 ', N'ED608689  ', N'trepicandor')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM674873  ', N'CH55lkk97 ', N'ED841430  ', N'vantis. et brevens,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM690892  ', N'CH47zlc75 ', N'ED536554  ', N'vobis trepicandor')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM706577  ', N'CH36flc52 ', N'ED408053  ', N'Versus homo, fecit.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM720771  ', N'CH37hzy84 ', N'ED295770  ', N'quo, quorum e Pro si')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM733801  ', N'CH55ehh53 ', N'ED524729  ', N'cognitio, eggredior.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM739772  ', N'CH97lxz15 ', N'ED779066  ', N'quad novum non et')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM752629  ', N'CH02fok26 ', N'ED832567  ', N'si apparens')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM754025  ', N'CH60ekf63 ', N'ED249136  ', N'et quo linguens')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM797923  ', N'CH91hbs23 ', N'ED841430  ', N'quorum in gravis Sed')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM798683  ', N'CH00mcu55 ', N'ED518373  ', N'glavans quo, fecit,')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM839212  ', N'CH37hzy84 ', N'ED524729  ', N'quad travissimantor')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM868577  ', N'CH55lkk97 ', N'ED250938  ', N'pars novum sed nomen')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM874174  ', N'CH94xtf74 ', N'ED408053  ', N'glavans et delerium.')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM881927  ', N'CH47zlc75 ', N'ED779066  ', N'quo, estis nomen et')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM899486  ', N'CH13jgy42 ', N'ED536554  ', N'non novum plorum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM901935  ', N'CH75rnu90 ', N'ED027100  ', N'et plurissimum Tam')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM910276  ', N'CH92bex81 ', N'ED249136  ', N'apparens non')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM917770  ', N'CH59hfs76 ', N'ED250938  ', N'Multum rarendum Tam')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM936153  ', N'CH09tow28 ', N'ED524729  ', N'e fecundio, si')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM936896  ', N'CH60ekf63 ', N'ED832567  ', N'fecit, quartu bono')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM936902  ', N'CH75rnu90 ', N'ED408053  ', N'non fecit. si')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM953250  ', N'CH02fok26 ', N'ED027100  ', N'novum quis rarendum')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM958157  ', N'CH20zea77 ', N'ED249136  ', N'quo in fecit, et')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM970487  ', N'CH55ehh53 ', N'ED524729  ', N'nomen Id fecit. quo')
INSERT [dbo].[COMMENT] ([COMMENTID], [CHAPTERID], [EDITORID], [CONTENT]) VALUES (N'CM977562  ', N'CH30tpw11 ', N'ED785700  ', N'Longam, Et quo,')
GO
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR07171606', N'AU4351179 ', N'ST787374  ', N'ED408053  ', N'transit. dolorum non et quartu essit. e rarendum', 1259.0429089817078, 838.99559626917267)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR07810424', N'AU3639829 ', N'ST463060  ', N'ED249136  ', N'et quo quad quad venit. parte quoque cognitio,', 70.732731867368884, 65.022235)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR08572005', N'AU6873987 ', N'ST684696  ', N'ED295770  ', N'e quorum esset et quantare quo, brevens, non nomen', 1882.7135125285511, 800.549812839237)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR08679179', N'AU3350395 ', N'ST673693  ', N'ED359509  ', N'Sed linguens novum plurissimum linguens manifestum', 1215.5341102145062, 218.43145261926159)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR10970447', N'AU7922632 ', N'ST10970447', N'ED518373  ', N'jsdalkjdhsa', 1212.516744142353, 0)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR16792160', N'AU1173555 ', N'ST437900  ', N'ED779066  ', N'vobis si sed fecundio, quo eggredior. quad', 1865.9388814083497, 1386.1826804515004)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR17558156', N'AU0886539 ', N'ST044251  ', N'ED524729  ', N'Pro fecit, et quoque fecit, ut Multum quis nomen e', 960.22457232601937, 468.5677462722681)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR21714157', N'AU4134982 ', N'ST355048  ', N'ED027100  ', N'Pro nomen novum bono gravis rarendum eggredior.', 1437.9390022204468, 1341.5733494326944)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR24510292', N'AU3958504 ', N'ST164095  ', N'ED518373  ', N'vobis bono novum rarendum glavans non imaginator', 551.1913380520848, 125.83499040400062)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR25493295', N'AU3240325 ', N'ST192568  ', N'ED779066  ', N'sed et gravum plurissimum dolorum Multum quad', 1242.4652161999757, 1123.3479939987778)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR27638055', N'AU2481760 ', N'ST890117  ', N'ED841430  ', N'in in quorum quantare delerium. et quad pladior ut', 464.44713760107669, 350.022235)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR29992167', N'AU2563038 ', N'ST999614  ', N'ED295770  ', N'homo, trepicandor linguens apparens Tam et quartu', 1355.3180612874294, 1155.8666439863771)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR30239177', N'AU5492956 ', N'ST001978  ', N'ED949502  ', N'in nomen quo, estum. eggredior. quis eggredior.', 1099.9056534161016, 140.18614232951785)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR30571343', N'AU7631127 ', N'ST684696  ', N'ED536554  ', N'dolorum Id non quis brevens, vobis manifestum Pro', 1391.3505728416599, 904.878949275422)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR32297442', N'AU2078699 ', N'ST999614  ', N'ED478628  ', N'si e novum et apparens vobis funem. eggredior.', 467.55538871076544, 272.18828213181553)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR34265350', N'AU8484232 ', N'ST497513  ', N'ED524729  ', N'e fecundio, quantare vobis fecit. Sed et quorum si', 775.10259137126945, 168.60326488603451)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR39196514', N'AU4101314 ', N'ST999614  ', N'ED249136  ', N'si non quad quartu gravis in Tam volcans quad', 82.787158279270656, 82.78)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR40752573', N'AU7631127 ', N'ST966654  ', N'ED536554  ', N'habitatio volcans estum. e si delerium. manifestum', 1111.1658812095063, 957.5937405572879)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR43497254', N'AU7922632 ', N'ST43497254', N'ED518373  ', N'abcxyz', 920.85885158757367, 0)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR43812496', N'AU4804294 ', N'ST463060  ', N'ED931645  ', N'rarendum transit. et egreddior et apparens quorum', 608.40242616125045, 158.64663180400748)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR45977627', N'AU6873987 ', N'ST497513  ', N'ED536554  ', N'estum. travissimantor venit. Pro quo Quad quartu', 88.119229991558115, 88.11)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR47664050', N'AU7922632 ', N'ST963268  ', N'ED250938  ', N'estis manifestum quis eggredior. estum. homo, non', 1367.8959043882935, 379.69300595476682)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR47900076', N'AU2078699 ', N'ST922132  ', N'ED478628  ', N'egreddior dolorum fecit. e brevens, estis Et', 796.94201639878929, 522.78420113648531)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR48606032', N'AU7947660 ', N'ST001978  ', N'ED359509  ', N'et quad estis cognitio, Quad cognitio, e gravum', 1414.9578654881084, 934.70486944270431)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR49623107', N'AU4351179 ', N'ST517649  ', N'ED518373  ', N'si fecit. eudis imaginator plurissimum Tam Id', 1845.7096565550987, 1259.2475807669341)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR53080261', N'AU1173555 ', N'ST999614  ', N'ED779066  ', N'quorum pladior venit. ut Tam nomen plurissimum', 1619.9517359461381, 165.60505056599064)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR54605100', N'AU4804294 ', N'ST207750  ', N'ED931645  ', N'regit, pladior essit. nomen Sed Et quad esset', 1331.7203793314191, 860.99808878261774)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR55136439', N'AU8691099 ', N'ST463060  ', N'ED608689  ', N'fecit. gravis si Longam, homo, novum e linguens', 1055.8713131474256, 1037.298542721788)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR56451566', N'AU6330488 ', N'ST711850  ', N'ED408053  ', N'dolorum brevens, delerium. dolorum et habitatio', 1627.7549518972119, 444.07011234015016)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR68876627', N'AU8691099 ', N'ST673693  ', N'ED931645  ', N'essit. estis quo brevens, bono vobis plurissimum', 1936.5797189654049, 279.0201125457744)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR6974576 ', N'AU7922632 ', N'ST6974576 ', N'ED518373  ', N'abcxyz', 66.4335162791118, 0)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR73907397', N'AU2765992 ', N'ST207750  ', N'ED249136  ', N'in non homo, apparens funem. delerium. Versus quo,', 606.47915938042047, 424.066520689582)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR75076893', N'AU3350395 ', N'ST787374  ', N'ED359509  ', N'pladior linguens brevens, trepicandor imaginator', 1230.1803375264467, 1038.6348697438314)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR77143552', N'AU4134982 ', N'ST375419  ', N'ED027100  ', N'novum Sed Quad linguens eggredior. et quoque e', 1015.0509388591426, 523.35261593415225)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR77442227', N'AU2563038 ', N'ST001978  ', N'ED295770  ', N'plorum brevens, vantis. in regit, estis Multum', 864.86243651998927, 201.70505311326562)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR87684961', N'AU2481760 ', N'ST887428  ', N'ED841430  ', N'parte si volcans bono e eggredior. glavans', 1625.2995267308158, 1502.3559511221686)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR88992901', N'AU7922632 ', N'ST517649  ', N'ED518373  ', N'Pro ut fecundio, Tam ut travissimantor', 1452.9369940598112, 387.18805028429892)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR89718728', N'AU2024405 ', N'ST684696  ', N'ED478628  ', N'Et quartu linguens essit. et manifestum plorum', 717.18103769324762, 640.00909909831239)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR93080527', N'AU6330488 ', N'ST887428  ', N'ED408053  ', N'Longam, vantis. si in pladior non Quad quo plorum', 945.04920676800634, 623.278504216834)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR96147898', N'AU5492956 ', N'ST999614  ', N'ED949502  ', N'regit, quorum quo, non estis gravis si estum.', 877.20602085749545, 552.16392029217445)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR96645841', N'AU3740895 ', N'ST990067  ', N'ED785700  ', N'egreddior vobis ut e estum. pladior Et esset et', 1946.3990251307341, 1380.2401593712041)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR97650276', N'AU3639829 ', N'ST150152  ', N'ED524729  ', N'parte sed fecit, nomen quo, quad Pro fecundio, in', 370.47880071145295, 137.75313812607428)
INSERT [dbo].[DRAFT] ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'DR99506745', N'AU2024405 ', N'ST346311  ', N'ED841430  ', N'habitatio et funem. funem. nomen vobis et eudis Et', 1853.3095579140882, 123.94440086938762)
GO
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED027100  ', N'AD307730  ', N'Darrick Landry                ', N'lbuba262@lmn.net              ', N'(193) 830-2854 ', N'Gary600             ', 199.03207004490872, N'OCPU3OV4            ', N'avatar_vio_19.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED249136  ', N'AD871991  ', N'Pamela Gentry                 ', N'txkxyn@kim.com                ', N'089-149-4881   ', N'Danny256            ', 268.20024450691426, N'B5YNFW0W            ', N'avatar_vio_9.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED250938  ', N'AD522737  ', N'Rickey Martin                 ', N'ezkfy0@jzv.net                ', N'(340) 219-0648 ', N'Darin506            ', 1067.7736238426405, N'ZIVYZFC3            ', N'avatar_vio_5.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED295770  ', N'AD328644  ', N'Joseph Casey                  ', N'ktvoz566@ozh.net              ', N'146-535-6250   ', N'Gavin624            ', 1556.5553999303634, N'H6EU3I8Z            ', N'avatar_vio_19.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED359509  ', N'AD871991  ', N'Jill Newton                   ', N'htkc56@ypt.com                ', N'(126) 139-0777 ', N'Laurie179           ', 1264.779227326987, N'D8ORGLPH            ', N'avatar_vio_11.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED408053  ', N'AD936223  ', N'Marcus Lam                    ', N'araenhou0@lty.com             ', N'326-709-2812   ', N'Kerrie754           ', 1372.8874167534, N'76HVZ13K            ', N'avatar_vio_14.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED478628  ', N'AD174920  ', N'Todd Kaufman                  ', N'acitxpa5@vfn.org              ', N'(042) 444-6280 ', N'Latasha728          ', 1038.2341705440704, N'8EKHMZU8            ', N'avatar_vio_11.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED518373  ', N'AD790170  ', N'Noah Keith                    ', N'mxjl@rsr.net                  ', N'817-884-8312   ', N'Amy312              ', 1571.9006610903425, N'1QGI1OH4            ', N'avatar_vio_10.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED524729  ', N'AD174920  ', N'Floyd Vega                    ', N'qwshbxg@fil.org               ', N'(500) 510-2072 ', N'Leslie477           ', 631.14309845545483, N'VF2BYUCO            ', N'avatar_vio_15.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED536554  ', N'AD936223  ', N'Neal Bentley                  ', N'gjznsut@ony.com               ', N'783-699-8135   ', N'Damion488           ', 1768.2602961632704, N'9UI66TQY            ', N'avatar_vio_11.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED563342  ', N'AD328644  ', N'Jerome Daniel                 ', N'rdshxmso987@qyj.net           ', N'506-948-5083   ', N'Grant212            ', 848.64334801614439, N'RD9MPIZT            ', N'avatar_vio_5.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED608689  ', N'AD790170  ', N'Esther Howard                 ', N'afayih@qip.com                ', N'416-747-5316   ', N'Adam860             ', 1349.9155762372145, N'64YFO5YX            ', N'avatar_vio_17.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED779066  ', N'AD342720  ', N'Lea Willis                    ', N'uumguh80@flc.com              ', N'(632) 510-3906 ', N'Kevin256            ', 1307.084863496518, N'0U2GPZRI            ', N'avatar_vio_9.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED785700  ', N'AD808006  ', N'Brandy Cameron                ', N'bfntnm5@vzi.net               ', N'(612) 635-3957 ', N'Trina684            ', 1009.0703949840136, N'DD1X602C            ', N'avatar_vio_7.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED832567  ', N'AD986496  ', N'Ross Woods                    ', N'lytiruh@sxf.org               ', N'(961) 238-9153 ', N'Damon804            ', 123.97314998040588, N'9DDWA10E            ', N'avatar_vio_15.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED841430  ', N'AD986496  ', N'Ruth Boyer                    ', N'nyfshqu@ctf.org               ', N'335-314-0280   ', N'Chester186          ', 682.73871251509468, N'C7WKICWV            ', N'avatar_vio_7.jpg                                  ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED931645  ', N'AD307730  ', N'Rebekah Dillon                ', N'gqmxkeuj740@pmo.org           ', N'843-115-4233   ', N'Claudia618          ', 341.24434748256783, N'WK7OXSYM            ', N'avatar_vio_15.jpg                                 ')
INSERT [dbo].[EDITOR] ([EDITORID], [ADMINID], [EDITORNAME], [EMAIL], [PHONENUMBER], [USERNAME], [SALARY], [PASSWORD], [AVATAR]) VALUES (N'ED949502  ', N'AD342720  ', N'Susan Douglas                 ', N'rageu@poo.com                 ', N'001-186-5684   ', N'Veronica393         ', 360.1316065341847, N'H4IG1UNR            ', N'avatar_vio_11.jpg                                 ')
GO
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'03048     ', N'AU3639829 ', N'ED249136  ', N'ST463060  ', N'Et et et quad fecit, plurissimum nomen novum esset', 326.65892107256633, 134.97999767964259)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'06250     ', N'AU8691099 ', N'ED931645  ', N'ST673693  ', N'quad plorum linguens cognitio, fecit. quo, bono', 1549.9789237743144, 374.9623766732085)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'06621     ', N'AU3350395 ', N'ED359509  ', N'ST787374  ', N'non e Pro quantare quo, nomen parte funem. pars', 534.4342645185227, 534.3522334007796)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'10624     ', N'AU2481760 ', N'ED841430  ', N'ST887428  ', N'linguens apparens non ut et cognitio, quoque Sed', 1683.802500662302, 154.70828890281774)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'10673     ', N'AU3350395 ', N'ED359509  ', N'ST673693  ', N'regit, venit. si volcans non quo nomen Multum', 1497.0049275304214, 974.17955635802036)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'11779     ', N'AU4351179 ', N'ED408053  ', N'ST787374  ', N'fecit, quo plurissimum quad plurissimum estum.', 1698.0934652956639, 623.33985176363069)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'12561     ', N'AU7922632 ', N'ED250938  ', N'ST963268  ', N'Id vantis. Tam sed eggredior. plorum vobis Quad', 62.988047796761641, 57.925206522403236)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'15916     ', N'AU6330488 ', N'ED408053  ', N'ST711850  ', N'quis egreddior si et non regit, plorum et et e sed', 283.02542694519525, 69.605953780743192)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'16706     ', N'AU7922632 ', N'ED518373  ', N'ST517649  ', N'e si eudis Multum estum. et cognitio, delerium.', 355.17126727158728, 227.49812551282722)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'17368     ', N'AU3639829 ', N'ED524729  ', N'ST150152  ', N'et fecundio, homo, linguens Sed regit, et funem.', 559.06289485705224, 174.85027113362492)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'19107     ', N'AU8691099 ', N'ED608689  ', N'ST463060  ', N'Pro travissimantor plorum et eggredior. Quad ut', 1062.366980436429, 236.88387458157794)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'19964     ', N'AU2078699 ', N'ED478628  ', N'ST922132  ', N'manifestum brevens, quantare si pars apparens', 1318.070301887612, 141.17110294126564)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'20651     ', N'AU4134982 ', N'ED027100  ', N'ST375419  ', N'ut Versus delerium. novum Et Multum Tam Versus', 1838.6103730362888, 1298.6331639280056)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'20859     ', N'AU0886539 ', N'ED524729  ', N'ST044251  ', N'fecit. transit. novum linguens rarendum sed in et', 512.60476585598883, 68.2366147252911)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'22572     ', N'AU1173555 ', N'ED779066  ', N'ST999614  ', N'apparens quo transit. quoque et quoque linguens', 1437.50416847761, 1205.9971725631779)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'24879     ', N'AU4804294 ', N'ED931645  ', N'ST463060  ', N'cognitio, rarendum habitatio rarendum Sed', 206.85431466291394, 149.98224640834741)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'34564     ', N'AU2563038 ', N'ED295770  ', N'ST001978  ', N'quis et quo, gravis estis et fecundio, vobis quad', 362.85249244554547, 332.42854812709203)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'35142     ', N'AU2563038 ', N'ED295770  ', N'ST999614  ', N'vantis. ut egreddior quo homo, Et Id quartu et quo', 447.23616286517876, 111.02177862626067)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'37462     ', N'AU3240325 ', N'ED779066  ', N'ST192568  ', N'quo bono vobis et transit. vobis essit. egreddior', 1462.1975265965784, 604.04223279543169)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'39825     ', N'AU4351179 ', N'ED518373  ', N'ST517649  ', N'quantare quo, volcans plorum plorum vobis pladior', 86.545654612847443, 57.925206522403236)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'41548     ', N'AU4804294 ', N'ED931645  ', N'ST207750  ', N'si plorum Pro si e pladior dolorum fecit. et', 923.44906398721457, 881.15730313579445)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'42586     ', N'AU1173555 ', N'ED779066  ', N'ST437900  ', N'Et si quorum brevens, manifestum trepicandor', 634.16302538670743, 51.285322697476218)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'44536     ', N'AU4134982 ', N'ED027100  ', N'ST355048  ', N'travissimantor apparens essit. quo pladior in', 773.70352641386137, 199.82160442483891)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'45550     ', N'AU4101314 ', N'ED249136  ', N'ST999614  ', N'cognitio, et dolorum e Tam plurissimum cognitio,', 338.22505345485411, 176.38039493346039)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'46284     ', N'AU7631127 ', N'ED536554  ', N'ST966654  ', N'quo et cognitio, quantare Versus venit. dolorum in', 1276.1229426954515, 505.48495194445042)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'46832     ', N'AU5492956 ', N'ED949502  ', N'ST001978  ', N'novum glavans transit. Multum ut nomen e linguens', 458.24868353467838, 126.62732064966367)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'47103     ', N'AU3958504 ', N'ED518373  ', N'ST164095  ', N'sed quad apparens plurissimum et Multum cognitio,', 814.10159494918844, 527.29141150469172)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'56082     ', N'AU7947660 ', N'ED359509  ', N'ST001978  ', N'fecit. quantare habitatio cognitio, plorum in', 1123.0419462654004, 157.94422217564141)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'56327     ', N'AU6873987 ', N'ED536554  ', N'ST497513  ', N'Pro e Tam plorum vantis. et regit, fecit. pars non', 944.30019911113209, 614.49635121575875)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'57354     ', N'AU8484232 ', N'ED524729  ', N'ST497513  ', N'Et et vantis. pars estis Longam, non eudis et', 1962.0292908800902, 309.3385220178352)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'57675     ', N'AU2078699 ', N'ED478628  ', N'ST999614  ', N'quad Versus imaginator gravum Quad gravis', 773.857818671436, 59.0687697198334)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'59400     ', N'AU5492956 ', N'ED949502  ', N'ST999614  ', N'venit. apparens cognitio, non linguens Versus sed', 262.84948730042646, 172.01223261268245)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'60888     ', N'AU6873987 ', N'ED295770  ', N'ST684696  ', N'nomen regit, Multum Longam, in non gravis', 707.29457529135732, 305.48944776155628)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'63016     ', N'AU2024405 ', N'ED478628  ', N'ST684696  ', N'Multum rarendum funem. estis Longam, brevens, quo', 309.32426429787847, 163.93847899470902)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'70494     ', N'AU2024405 ', N'ED841430  ', N'ST346311  ', N'habitatio non quorum gravis quis quo, cognitio,', 512.95669926933783, 76.056356087862227)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'73537     ', N'AU7631127 ', N'ED536554  ', N'ST684696  ', N'eggredior. venit. parte fecundio, estis novum', 1331.0806938126129, 911.94646661266268)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'82606     ', N'AU6330488 ', N'ED408053  ', N'ST887428  ', N'fecit. transit. venit. et quad egreddior quad non', 144.38959569409005, 116.68345506916009)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'87286     ', N'AU3740895 ', N'ED785700  ', N'ST990067  ', N'et apparens et estum. Versus ut gravis non nomen e', 788.24162580456664, 270.29247695781191)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'89164     ', N'AU2481760 ', N'ED841430  ', N'ST890117  ', N'Id trepicandor Et venit. fecundio, Pro si non', 875.63979852741579, 812.72455348835456)
INSERT [dbo].[OUTLINE] ([OUTLINEID], [AUTHORID], [EDITORID], [STORYID], [CONTENT], [GIA], [UNPAIR]) VALUES (N'89517     ', N'AU2765992 ', N'ED249136  ', N'ST207750  ', N'egreddior linguens manifestum travissimantor', 1917.0109538673476, 1516.0286733231719)
GO
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST001775  ', N'AU7947660 ', N'ED359509  ', N'Rezapicistor                  ', N'ON GOING            ', 3, N'roman     ', N'avatar_vio_7.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST001978  ', N'AU8691099 ', N'ED931645  ', N'Parrobicower                  ', N'DONE                ', 3, N'thriller  ', N'avatar_vio_5.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST015092  ', N'AU2024405 ', N'ED478628  ', N'Uprobistor                    ', N'ON GOING            ', 0, N'detective ', N'avatar_vio_10.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST044251  ', N'AU2024405 ', N'ED841430  ', N'Emsapan                       ', N'ON GOING            ', 0, N'detective ', N'avatar_vio_12.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST10970447', N'AU7922632 ', N'ED518373  ', N'Công Chúa Ngủ Ban Ngày        ', N'ON GOING            ', 0, N'roman     ', N'avatar_vio_6.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST114044  ', N'AU1173555 ', N'ED779066  ', N'Parsipinower                  ', N'ON GOING            ', 2, N'pastoral  ', N'avatar_vio_2.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST118376  ', N'AU2765992 ', N'ED249136  ', N'Hapnipegin                    ', N'ON GOING            ', 0, N'novel     ', N'avatar_vio_12.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST141519  ', N'AU3639829 ', N'ED524729  ', N'Dopkilar                      ', N'ON GOING            ', 0, N'antinovel ', N'avatar_vio_13.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST150152  ', N'AU4101314 ', N'ED249136  ', N'Cipdudazz                     ', N'ON GOING            ', 0, N'mystery   ', N'avatar_vio_12.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST164095  ', N'AU2078699 ', N'ED478628  ', N'Trumunar                      ', N'ON GOING            ', 0, N'novel     ', N'avatar_vio_7.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST188007  ', N'AU0886539 ', N'ED524729  ', N'Cipjubackex                   ', N'DONE                ', 3, N'thriller  ', N'avatar_vio_15.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST192568  ', N'AU4804294 ', N'ED931645  ', N'Endpebepicator                ', N'ON GOING            ', 0, N'antinovel ', N'avatar_vio_4.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST207750  ', N'AU3740895 ', N'ED785700  ', N'Upjubazz                      ', N'ON GOING            ', 3, N'roman     ', N'avatar_vio_5.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST346311  ', N'AU7922632 ', N'ED518373  ', N'Zeewerpex                     ', N'ON GOING            ', 0, N'antinovel ', N'avatar_vio_8.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST355048  ', N'AU4134982 ', N'ED027100  ', N'Montinonex                    ', N'ON GOING            ', 0, N'pastoral  ', N'avatar_vio_1.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST369494  ', N'AU4134982 ', N'ED027100  ', N'Surpebower                    ', N'ON GOING            ', 0, N'pastoral  ', N'avatar_vio_8.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST375419  ', N'AU7631127 ', N'ED536554  ', N'Montanan                      ', N'ON GOING            ', 0, N'pastoral  ', N'avatar_vio_3.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST382917  ', N'AU4804294 ', N'ED931645  ', N'Monrobewin                    ', N'DONE                ', 3, N'historical', N'avatar_vio_16.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST43497254', N'AU7922632 ', N'ED518373  ', N'Công Chúa Đi Qua Đêm          ', N'ON GOING            ', 0, N'roman     ', N'avatar_vio_14.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST437900  ', N'AU4351179 ', N'ED518373  ', N'Dopzapplin                    ', N'ON GOING            ', 2, N'thriller  ', N'avatar_vio_11.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST463060  ', N'AU1173555 ', N'ED779066  ', N'Endglibor                     ', N'ON GOING            ', 1, N'picaresque', N'avatar_vio_15.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST470636  ', N'AU5492956 ', N'ED949502  ', N'Montanower                    ', N'DONE                ', 1, N'thriller  ', N'avatar_vio_9.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST497439  ', N'AU5492956 ', N'ED949502  ', N'Tupjubex                      ', N'ON GOING            ', 0, N'roman     ', N'avatar_vio_9.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST497513  ', N'AU2563038 ', N'ED295770  ', N'Admunicator                   ', N'DONE                ', 3, N'novel     ', N'avatar_vio_4.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST517649  ', N'AU6330488 ', N'ED408053  ', N'Trudimin                      ', N'DONE                ', 1, N'pastoral  ', N'avatar_vio_6.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST613498  ', N'AU3240325 ', N'ED779066  ', N'Tippebantor                   ', N'DONE                ', 3, N'pastoral  ', N'avatar_vio_16.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST662842  ', N'AU3350395 ', N'ED359509  ', N'Supvenower                    ', N'ON GOING            ', 0, N'picaresque', N'avatar_vio_15.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST673693  ', N'AU8691099 ', N'ED608689  ', N'Surnipefover                  ', N'ON GOING            ', 0, N'mystery   ', N'avatar_vio_1.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST676527  ', N'AU6873987 ', N'ED536554  ', N'Adtanin                       ', N'ON GOING            ', 0, N'thriller  ', N'avatar_vio_3.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST684696  ', N'AU2563038 ', N'ED295770  ', N'Advenentor                    ', N'ON GOING            ', 0, N'mystery   ', N'avatar_vio_11.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST690542  ', N'AU2481760 ', N'ED841430  ', N'Rapmunicator                  ', N'ON GOING            ', 3, N'picaresque', N'avatar_vio_15.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST6974576 ', N'AU7922632 ', N'ED518373  ', N'Công Chú Ngủ Ở Nhà            ', N'ON GOING            ', 0, N'roman     ', N'avatar_vio_13.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST711850  ', N'AU3639829 ', N'ED249136  ', N'Adnipedgan                    ', N'ON GOING            ', 0, N'roman     ', N'avatar_vio_12.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST787374  ', N'AU4351179 ', N'ED408053  ', N'Unerex                        ', N'ON GOING            ', 2, N'historical', N'avatar_vio_17.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST811858  ', N'AU2481760 ', N'ED841430  ', N'Lompickepicator               ', N'ON GOING            ', 0, N'historical', N'avatar_vio_2.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST887428  ', N'AU8484232 ', N'ED524729  ', N'Tupjubimin                    ', N'ON GOING            ', 3, N'novel     ', N'avatar_vio_10.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST890117  ', N'AU2078699 ', N'ED478628  ', N'Klijubadazz                   ', N'ON GOING            ', 0, N'antinovel ', N'avatar_vio_6.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST922132  ', N'AU7631127 ', N'ED536554  ', N'Incadefax                     ', N'ON GOING            ', 3, N'pastoral  ', N'avatar_vio_4.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST939606  ', N'AU6873987 ', N'ED295770  ', N'Parzapewor                    ', N'ON GOING            ', 0, N'picaresque', N'avatar_vio_17.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST963268  ', N'AU6330488 ', N'ED408053  ', N'Rekilin                       ', N'ON GOING            ', 0, N'detective ', N'avatar_vio_9.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST966654  ', N'AU3350395 ', N'ED359509  ', N'Trutinex                      ', N'ON GOING            ', 0, N'historical', N'avatar_vio_1.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST990067  ', N'AU3958504 ', N'ED518373  ', N'Uppebedgan                    ', N'ON GOING            ', 1, N'mystery   ', N'avatar_vio_3.jpg')
INSERT [dbo].[STORY] ([STORYID], [AUTHORID], [EDITORID], [STORYNAME], [STATE], [NUMOFCHAPS], [TYPE], [AVATAR]) VALUES (N'ST999614  ', N'AU7922632 ', N'ED250938  ', N'Supkililentor                 ', N'DONE                ', 3, N'historical', N'avatar_vio_12.jpg')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MANAGE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [MANAGE_FK] ON [dbo].[AUTHOR]
(
	[ADMINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SUPERVISE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [SUPERVISE_FK] ON [dbo].[AUTHOR]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ADD_UPDATE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [ADD_UPDATE_FK] ON [dbo].[CHAPTER]
(
	[AUTHORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [APPROVE_DECLINE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [APPROVE_DECLINE_FK] ON [dbo].[CHAPTER]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [HAVE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [HAVE_FK] ON [dbo].[CHAPTER]
(
	[OUTLINEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [HAVE_FK2]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [HAVE_FK2] ON [dbo].[CHAPTER]
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MAKE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [MAKE_FK] ON [dbo].[COMMENT]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ON_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [ON_FK] ON [dbo].[COMMENT]
(
	[CHAPTERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [APPROVE_DECLINE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [APPROVE_DECLINE_FK] ON [dbo].[DRAFT]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INCLUDE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [INCLUDE_FK] ON [dbo].[DRAFT]
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WRITE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [WRITE_FK] ON [dbo].[DRAFT]
(
	[AUTHORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MANAGE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [MANAGE_FK] ON [dbo].[EDITOR]
(
	[ADMINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ADD_UPDATE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [ADD_UPDATE_FK] ON [dbo].[OUTLINE]
(
	[AUTHORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [APPROVE_DECLINE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [APPROVE_DECLINE_FK] ON [dbo].[OUTLINE]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CONSIST_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [CONSIST_FK] ON [dbo].[OUTLINE]
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [APPROVE_DECLINE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [APPROVE_DECLINE_FK] ON [dbo].[STORY]
(
	[EDITORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CONSIST_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [CONSIST_FK] ON [dbo].[STORY]
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INCLUDE_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [INCLUDE_FK] ON [dbo].[STORY]
(
	[STORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OWN_FK]    Script Date: 12/31/2022 5:48:45 PM ******/
CREATE NONCLUSTERED INDEX [OWN_FK] ON [dbo].[STORY]
(
	[AUTHORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AUTHOR]  WITH CHECK ADD  CONSTRAINT [FK_AUTHOR_MANAGE_ADMIN] FOREIGN KEY([ADMINID])
REFERENCES [dbo].[ADMIN] ([ADMINID])
GO
ALTER TABLE [dbo].[AUTHOR] CHECK CONSTRAINT [FK_AUTHOR_MANAGE_ADMIN]
GO
ALTER TABLE [dbo].[AUTHOR]  WITH CHECK ADD  CONSTRAINT [FK_AUTHOR_SUPERVISE_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[AUTHOR] CHECK CONSTRAINT [FK_AUTHOR_SUPERVISE_EDITOR]
GO
ALTER TABLE [dbo].[CHAPTER]  WITH CHECK ADD  CONSTRAINT [FK_CHAPTER_ADD_UPDAT_AUTHOR] FOREIGN KEY([AUTHORID])
REFERENCES [dbo].[AUTHOR] ([AUTHORID])
GO
ALTER TABLE [dbo].[CHAPTER] CHECK CONSTRAINT [FK_CHAPTER_ADD_UPDAT_AUTHOR]
GO
ALTER TABLE [dbo].[CHAPTER]  WITH CHECK ADD  CONSTRAINT [FK_CHAPTER_APPROVE_D_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[CHAPTER] CHECK CONSTRAINT [FK_CHAPTER_APPROVE_D_EDITOR]
GO
ALTER TABLE [dbo].[CHAPTER]  WITH CHECK ADD  CONSTRAINT [FK_CHAPTER_HAVE_OUTLINE] FOREIGN KEY([OUTLINEID])
REFERENCES [dbo].[OUTLINE] ([OUTLINEID])
GO
ALTER TABLE [dbo].[CHAPTER] CHECK CONSTRAINT [FK_CHAPTER_HAVE_OUTLINE]
GO
ALTER TABLE [dbo].[CHAPTER]  WITH CHECK ADD  CONSTRAINT [FK_CHAPTER_HAVE_STORY] FOREIGN KEY([STORYID])
REFERENCES [dbo].[STORY] ([STORYID])
GO
ALTER TABLE [dbo].[CHAPTER] CHECK CONSTRAINT [FK_CHAPTER_HAVE_STORY]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_MAKE_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_MAKE_EDITOR]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_ON_CHAPTER] FOREIGN KEY([CHAPTERID])
REFERENCES [dbo].[CHAPTER] ([CHAPTERID])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_ON_CHAPTER]
GO
ALTER TABLE [dbo].[DRAFT]  WITH CHECK ADD  CONSTRAINT [FK_DRAFT_APPROVE_D_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[DRAFT] CHECK CONSTRAINT [FK_DRAFT_APPROVE_D_EDITOR]
GO
ALTER TABLE [dbo].[DRAFT]  WITH CHECK ADD  CONSTRAINT [FK_DRAFT_INCLUDE_STORY] FOREIGN KEY([STORYID])
REFERENCES [dbo].[STORY] ([STORYID])
GO
ALTER TABLE [dbo].[DRAFT] CHECK CONSTRAINT [FK_DRAFT_INCLUDE_STORY]
GO
ALTER TABLE [dbo].[DRAFT]  WITH CHECK ADD  CONSTRAINT [FK_DRAFT_WRITE_AUTHOR] FOREIGN KEY([AUTHORID])
REFERENCES [dbo].[AUTHOR] ([AUTHORID])
GO
ALTER TABLE [dbo].[DRAFT] CHECK CONSTRAINT [FK_DRAFT_WRITE_AUTHOR]
GO
ALTER TABLE [dbo].[EDITOR]  WITH CHECK ADD  CONSTRAINT [FK_EDITOR_MANAGE_ADMIN] FOREIGN KEY([ADMINID])
REFERENCES [dbo].[ADMIN] ([ADMINID])
GO
ALTER TABLE [dbo].[EDITOR] CHECK CONSTRAINT [FK_EDITOR_MANAGE_ADMIN]
GO
ALTER TABLE [dbo].[OUTLINE]  WITH CHECK ADD  CONSTRAINT [FK_OUTLINE_ADD_UPDAT_AUTHOR] FOREIGN KEY([AUTHORID])
REFERENCES [dbo].[AUTHOR] ([AUTHORID])
GO
ALTER TABLE [dbo].[OUTLINE] CHECK CONSTRAINT [FK_OUTLINE_ADD_UPDAT_AUTHOR]
GO
ALTER TABLE [dbo].[OUTLINE]  WITH CHECK ADD  CONSTRAINT [FK_OUTLINE_APPROVE_D_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[OUTLINE] CHECK CONSTRAINT [FK_OUTLINE_APPROVE_D_EDITOR]
GO
ALTER TABLE [dbo].[OUTLINE]  WITH CHECK ADD  CONSTRAINT [FK_OUTLINE_CONSIST_STORY] FOREIGN KEY([STORYID])
REFERENCES [dbo].[STORY] ([STORYID])
GO
ALTER TABLE [dbo].[OUTLINE] CHECK CONSTRAINT [FK_OUTLINE_CONSIST_STORY]
GO
ALTER TABLE [dbo].[STORY]  WITH CHECK ADD  CONSTRAINT [FK_STORY_APPROVE_D_EDITOR] FOREIGN KEY([EDITORID])
REFERENCES [dbo].[EDITOR] ([EDITORID])
GO
ALTER TABLE [dbo].[STORY] CHECK CONSTRAINT [FK_STORY_APPROVE_D_EDITOR]
GO
ALTER TABLE [dbo].[STORY]  WITH CHECK ADD  CONSTRAINT [FK_STORY_OWN_AUTHOR] FOREIGN KEY([AUTHORID])
REFERENCES [dbo].[AUTHOR] ([AUTHORID])
GO
ALTER TABLE [dbo].[STORY] CHECK CONSTRAINT [FK_STORY_OWN_AUTHOR]
GO
ALTER TABLE [dbo].[CHAPTER]  WITH CHECK ADD  CONSTRAINT [CHECK_ChapterUNPAIR] CHECK  (([GIA]>=[UNPAIR]))
GO
ALTER TABLE [dbo].[CHAPTER] CHECK CONSTRAINT [CHECK_ChapterUNPAIR]
GO
ALTER TABLE [dbo].[DRAFT]  WITH CHECK ADD  CONSTRAINT [CHECK_UNPAIR] CHECK  (([GIA]>=[UNPAIR]))
GO
ALTER TABLE [dbo].[DRAFT] CHECK CONSTRAINT [CHECK_UNPAIR]
GO
ALTER TABLE [dbo].[OUTLINE]  WITH CHECK ADD  CONSTRAINT [CHECK_OUTLINEUNPAIR] CHECK  (([GIA]>=[UNPAIR]))
GO
ALTER TABLE [dbo].[OUTLINE] CHECK CONSTRAINT [CHECK_OUTLINEUNPAIR]
GO

USE [master]
GO
ALTER DATABASE [QLTG] SET  READ_WRITE 
GO
