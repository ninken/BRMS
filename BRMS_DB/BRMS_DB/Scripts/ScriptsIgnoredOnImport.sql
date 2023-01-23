
USE [master]
GO

ALTER DATABASE [BRMS] SET COMPATIBILITY_LEVEL = 150
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BRMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BRMS] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [BRMS] SET ANSI_NULLS OFF
GO

ALTER DATABASE [BRMS] SET ANSI_PADDING OFF
GO

ALTER DATABASE [BRMS] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [BRMS] SET ARITHABORT OFF
GO

ALTER DATABASE [BRMS] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [BRMS] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [BRMS] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [BRMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [BRMS] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [BRMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [BRMS] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [BRMS] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [BRMS] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [BRMS] SET  DISABLE_BROKER
GO

ALTER DATABASE [BRMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [BRMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [BRMS] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [BRMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [BRMS] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [BRMS] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [BRMS] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [BRMS] SET RECOVERY FULL
GO

ALTER DATABASE [BRMS] SET  MULTI_USER
GO

ALTER DATABASE [BRMS] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [BRMS] SET DB_CHAINING OFF
GO

ALTER DATABASE [BRMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [BRMS] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO

ALTER DATABASE [BRMS] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'BRMS', N'ON'
GO

ALTER DATABASE [BRMS] SET QUERY_STORE = OFF
GO

ALTER DATABASE [BRMS] SET  READ_WRITE
GO

USE [BRMS]
GO

/****** Object:  Table [dbo].[BusinessRuleLog]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  Table [dbo].[BusinessRules]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  Table [dbo].[BusinessRulesGroup]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  UserDefinedFunction [dbo].[GetCurrentUser]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspCheckSQL]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspExectueRule]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspExectueRuleGroup]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQL]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQLCNT]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQLUpdate]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspGenerateSQL]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspGenerateSQLUpdate]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_Database]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_Tables]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_TablesColumns]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_TablesColumnType]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_Views]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_ViewsColumns]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspList_ViewsColumnType]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleAddUpdate]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleGroupMaxOrder]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleGroupOrderFix]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleGroupRecInsert]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleGroupRecUpdate]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleGroupReorder]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleLogHistory]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleMaxOrder]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleOrderFix]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  StoredProcedure [dbo].[uspRuleReorder]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  View [dbo].[vRuleList]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [BRMS]
GO

/****** Object:  View [dbo].[vRuleLogHistory]    Script Date: 2023-01-22 6:09:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Database [BRMS]    Script Date: 2023-01-22 6:09:41 PM ******/
CREATE DATABASE [BRMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BRMS', FILENAME = N'J:\Database\SQLServer\Data\BRMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BRMS_log', FILENAME = N'J:\Database\SQLServer\Logs\BRMS_log.ldf' , SIZE = 663552KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF

GO

--Syntax Error: Expected DEFAULT_FULLTEXT_LANGUAGE but encountered CATALOG_COLLATION instead.
--/****** Object:  Database [BRMS]    Script Date: 2023-01-22 6:09:41 PM ******/
--CREATE DATABASE [BRMS]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'BRMS', FILENAME = N'J:\Database\SQLServer\Data\BRMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'BRMS_log', FILENAME = N'J:\Database\SQLServer\Logs\BRMS_log.ldf' , SIZE = 663552KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF

GO

ALTER DATABASE [BRMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  

GO

--Syntax Error: Incorrect syntax near ACCELERATED_DATABASE_RECOVERY.
--ALTER DATABASE [BRMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  

GO

CREATE TABLE [dbo].[BusinessRuleLog](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleStarted] [datetime] NOT NULL,
	[RuleEnded] [datetime] NULL,
	[RuleId] [int] NOT NULL,
	[RowsAffected] [int] NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Failed] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_BusinessRuleLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--CREATE TABLE [dbo].[BusinessRuleLog](
--	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
--	[RuleStarted] [datetime] NOT NULL,
--	[RuleEnded] [datetime] NULL,
--	[RuleId] [int] NOT NULL,
--	[RowsAffected] [int] NULL,
--	[Message] [nvarchar](max) NOT NULL,
--	[Failed] [bit] NULL,
--	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
-- CONSTRAINT [PK_BusinessRuleLog] PRIMARY KEY CLUSTERED 
--(
--	[LogId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Index [idx_CreateOn]    Script Date: 2023-01-22 6:09:41 PM ******/
CREATE NONCLUSTERED INDEX [idx_CreateOn] ON [dbo].[BusinessRuleLog]
(
	[RuleStarted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--/****** Object:  Index [idx_CreateOn]    Script Date: 2023-01-22 6:09:41 PM ******/
--CREATE NONCLUSTERED INDEX [idx_CreateOn] ON [dbo].[BusinessRuleLog]
--(
--	[RuleStarted] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

CREATE TABLE [dbo].[BusinessRules](
	[RuleId] [int] IDENTITY(1000,1) NOT NULL,
	[RuleGroup] [int] NOT NULL,
	[RuleOrderBy] [int] NOT NULL,
	[RuleExpression] [nvarchar](max) NULL,
	[RuleSetCommand] [nvarchar](max) NULL,
	[RuleTitle] [nvarchar](200) NULL,
	[RuleCreatedOn] [datetime2](7) NOT NULL,
	[RuleChangedOn] [datetime2](7) NOT NULL,
	[RuleCreatedBy] [nvarchar](50) NULL,
	[RuleChangedBy] [nvarchar](50) NULL,
	[RuleStartDate] [date] NOT NULL,
	[RuleEndDate] [date] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreateTransaction] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_BusinessRules] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--CREATE TABLE [dbo].[BusinessRules](
--	[RuleId] [int] IDENTITY(1000,1) NOT NULL,
--	[RuleGroup] [int] NOT NULL,
--	[RuleOrderBy] [int] NOT NULL,
--	[RuleExpression] [nvarchar](max) NULL,
--	[RuleSetCommand] [nvarchar](max) NULL,
--	[RuleTitle] [nvarchar](200) NULL,
--	[RuleCreatedOn] [datetime2](7) NOT NULL,
--	[RuleChangedOn] [datetime2](7) NOT NULL,
--	[RuleCreatedBy] [nvarchar](50) NULL,
--	[RuleChangedBy] [nvarchar](50) NULL,
--	[RuleStartDate] [date] NOT NULL,
--	[RuleEndDate] [date] NOT NULL,
--	[Active] [bit] NOT NULL,
--	[CreateTransaction] [bit] NOT NULL,
--	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
-- CONSTRAINT [PK_BusinessRules] PRIMARY KEY CLUSTERED 
--(
--	[RuleId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[BusinessRulesGroup](
	[RuleGroup] [int] IDENTITY(100,1) NOT NULL,
	[RuleGroupName] [nvarchar](60) NOT NULL,
	[DBTable] [nvarchar](150) NOT NULL,
	[TableName] [nvarchar](150) NOT NULL,
	[TableKey] [nvarchar](150) NULL,
	[DBView] [nvarchar](150) NULL,
	[ViewName] [nvarchar](150) NOT NULL,
	[ViewKey] [nvarchar](150) NULL,
	[GroupActive] [bit] NOT NULL,
	[GroupOrderBy] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_BusinessRulesGroup] PRIMARY KEY CLUSTERED 
(
	[RuleGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Business__B88BAC0E24B31348] UNIQUE NONCLUSTERED 
(
	[RuleGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--CREATE TABLE [dbo].[BusinessRulesGroup](
--	[RuleGroup] [int] IDENTITY(100,1) NOT NULL,
--	[RuleGroupName] [nvarchar](60) NOT NULL,
--	[DBTable] [nvarchar](150) NOT NULL,
--	[TableName] [nvarchar](150) NOT NULL,
--	[TableKey] [nvarchar](150) NULL,
--	[DBView] [nvarchar](150) NULL,
--	[ViewName] [nvarchar](150) NOT NULL,
--	[ViewKey] [nvarchar](150) NULL,
--	[GroupActive] [bit] NOT NULL,
--	[GroupOrderBy] [int] NULL,
--	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
-- CONSTRAINT [PK_BusinessRulesGroup] PRIMARY KEY CLUSTERED 
--(
--	[RuleGroup] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [UQ__Business__B88BAC0E24B31348] UNIQUE NONCLUSTERED 
--(
--	[RuleGroupName] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]



GO
