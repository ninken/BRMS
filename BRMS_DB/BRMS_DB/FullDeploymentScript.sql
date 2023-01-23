USE [master]
GO
/****** Object:  Database [BRMS]    Script Date: 2023-01-22 6:22:03 PM ******/
CREATE DATABASE [BRMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BRMS', FILENAME = N'J:\Database\SQLServer\Data\BRMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BRMS_log', FILENAME = N'J:\Database\SQLServer\Logs\BRMS_log.ldf' , SIZE = 663552KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
ALTER DATABASE [BRMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BRMS', N'ON'
GO
ALTER DATABASE [BRMS] SET QUERY_STORE = OFF
GO
USE [BRMS]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCurrentUser]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION	[dbo].[GetCurrentUser]()
RETURNS nvarchar(50)
AS
BEGIN
DECLARE @RUser nvarchar(50)
SET @RUser = Left(RIGHT(IsNull(SUSER_NAME(), (CHARINDEX('\', REVERSE(SUSER_NAME()), 1))-1),'5'),50)

Return(@RUser)
END
GO
/****** Object:  Table [dbo].[BusinessRulesGroup]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[BusinessRules]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[vRuleList]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[vRuleList] AS
Select Top 10000000
A.RuleGroup as GrpId, A.RuleGroupName as GroupName,A.GroupOrderBy, RuleId,B.RuleTitle, B.RuleOrderBy,B.RuleStartDate, B.RuleEndDate, B.Active, A.GroupActive
FROM            BusinessRulesGroup as A
INNER JOIN BusinessRules as B
on A.RuleGroup = B.RuleGroup
Order by A.GroupOrderBy,B.RuleOrderBy ASC
GO
/****** Object:  Table [dbo].[BusinessRuleLog]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[vRuleLogHistory]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vRuleLogHistory] AS

SELECT TOP 10000000 
    A.LogId, C.RuleGroupName, A.RuleId, B.RuleTitle, A.Message, A.RuleStarted, A.RuleEnded,A.RowsAffected, A.Failed
	FROM	BusinessRuleLog AS A
	INNER JOIN BusinessRules AS B
	ON A.RuleId = B.RuleId
	INNER JOIN dbo.BusinessRulesGroup AS C
	ON B.RuleGroup	= C.RuleGroup
WHERE A.RuleStarted > GETDATE()-30
ORDER BY A.RuleStarted DESC
GO
/****** Object:  Index [idx_CreateOn]    Script Date: 2023-01-22 6:22:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_CreateOn] ON [dbo].[BusinessRuleLog]
(
	[RuleStarted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusinessRuleLog] ADD  CONSTRAINT [DF_BusinessRuleLog_CreatedOn]  DEFAULT (getdate()) FOR [RuleStarted]
GO
ALTER TABLE [dbo].[BusinessRuleLog] ADD  CONSTRAINT [DF_BusinessRuleLog_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleCreatedOn]  DEFAULT (getdate()) FOR [RuleCreatedOn]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleChangeOn]  DEFAULT (getdate()) FOR [RuleChangedOn]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleCreatedBy]  DEFAULT (case when NOT suser_name() like '%\%' then suser_name() else left(right(suser_name(),charindex('\',reverse(suser_name()),(1))-(1)),(50)) end) FOR [RuleCreatedBy]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleChangeBy]  DEFAULT (case when NOT suser_name() like '%\%' then suser_name() else left(right(suser_name(),charindex('\',reverse(suser_name()),(1))-(1)),(50)) end) FOR [RuleChangedBy]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleStartDate]  DEFAULT (CONVERT([date],getdate())) FOR [RuleStartDate]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleEndDate]  DEFAULT (CONVERT([date],getdate()+(1))) FOR [RuleEndDate]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_CreateTransaction]  DEFAULT ((0)) FOR [CreateTransaction]
GO
ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BusinessRulesGroup] ADD  CONSTRAINT [DF_BusinessRulesGroup_Active]  DEFAULT ((1)) FOR [GroupActive]
GO
ALTER TABLE [dbo].[BusinessRulesGroup] ADD  CONSTRAINT [DF_BusinessRulesGroup_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BusinessRuleLog]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessRuleLog_BusinessRules] FOREIGN KEY([RuleId])
REFERENCES [dbo].[BusinessRules] ([RuleId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BusinessRuleLog] NOCHECK CONSTRAINT [FK_BusinessRuleLog_BusinessRules]
GO
ALTER TABLE [dbo].[BusinessRules]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessRules_BusinessRulesGroup] FOREIGN KEY([RuleGroup])
REFERENCES [dbo].[BusinessRulesGroup] ([RuleGroup])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BusinessRules] NOCHECK CONSTRAINT [FK_BusinessRules_BusinessRulesGroup]
GO
/****** Object:  StoredProcedure [dbo].[uspCheckSQL]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspCheckSQL](
@CustomQuery AS NVARCHAR(MAX),
@StatusMsg AS VARCHAR(MAX) OUTPUT
)
AS
BEGIN

BEGIN TRY
IF @CustomQuery IS NOT NULL BEGIN 
SET @CustomQuery =  'SET NOEXEC ON; ' + @CustomQuery + ' ; SET NOEXEC OFF;'
END

EXEC sp_executesql @CustomQuery
SET @StatusMsg = 'Success'
END TRY
BEGIN CATCH
SET @StatusMsg = ERROR_MESSAGE() 
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspExectueRule]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspExectueRule]  @RuleId INT, @OutputMsg NVARCHAR(1000) OUTPUT AS 
BEGIN
SET NOCOUNT ON
DECLARE @CNTSQL INT,@DTStart DateTime,@DTEnd DateTime, @GrpCNT INT,@vRuleCNT INT,@vRuleId INT,@GotSQL NVARCHAR(MAX),@UpdateMsg NVARCHAR(1000)
SET @OutputMsg = 'Not processed';
Set @DTStart = GetDate();

-- ERROR CHECKS
SELECT @vRuleId  = IsNull(RuleId,0) FROM [BRMS].[dbo].[BusinessRules] WHERE RuleId = @RuleId
IF @vRuleId <> @RuleId
BEGIN
PRINT 'Rule Id does not exists: '+ convert(varchar(18),@RuleId);
RETURN
END 

SELECT @vRuleId = IsNull(RuleId,0) FROM [BRMS].[dbo].[BusinessRules] WHERE (RuleId = @RuleId and Active = 1) AND GetDate() BETWEEN RuleStartDate AND RuleEndDate ORDER BY RuleOrderBy ASC;
IF @vRuleId <> @RuleId
BEGIN
PRINT 'Rule Id: '+ convert(varchar(18),@RuleId) +' is not active or expired' ;
RETURN
END 

EXECUTE [dbo].[uspGenerateRuleSQLCNT] @RuleId = @vRuleId, @vCount = @CNTSQL OUTPUT;

IF @CNTSQL = 0
BEGIN
SET @UpdateMsg = 'Rule Id:'+CONVERT(VARCHAR(18),@RuleId)+' has 0 records to update / is not active or has expired.'
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,0,@UpdateMsg,0);
SET @OutputMsg = 'No records';
END 

IF @CNTSQL <> 0
BEGIN
EXECUTE [dbo].[uspGenerateRuleSQLUpdate] @RuleId = @vRuleId, @vsql = @GotSQL OUTPUT
BEGIN TRY
BEGIN TRANSACTION
EXEC sp_executesql @GotSQL
SET @CNTSQL = @@ROWCOUNT
COMMIT TRANSACTION
SET @UpdateMsg = 'Successfully updated';
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
SET @UpdateMsg = 'UPDATE ERROR: ' + ERROR_MESSAGE()
END
END CATCH
END 


IF (@UpdateMsg = 'Successfully updated')
BEGIN
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,@CNTSQL,'Successfully updated',0);
SET @OutputMsg = 'Success';
END 

IF (@UpdateMsg like 'UPDATE ERROR:%')
BEGIN
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,@CNTSQL,IsNull(@UpdateMsg,'UPDATE ERROR'),-1);
SET @OutputMsg = 'Failed';
END 

END

GO
/****** Object:  StoredProcedure [dbo].[uspExectueRuleGroup]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspExectueRuleGroup]  @RuleGroup INT AS 
BEGIN
SET NOCOUNT ON
DECLARE @CNTSQL INT,@DTStart DateTime,@DTEnd DateTime, @GrpCNT INT,@vRuleCNT INT,@IsGrpActive BIT,@vRuleId INT,@GotSQL NVARCHAR(MAX),@UpdateMsg NVARCHAR(1000)
SET @DTStart = Getdate()

-- ERROR CHECKS
SELECT @GrpCNT = COUNT(*) FROM [dbo].[BusinessRulesGroup] WHERE RuleGroup = @RuleGroup
IF @GrpCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id:'+CONVERT(VARCHAR(18),@RuleGroup)+' does not exists in [dbo].[BusinessRulesGroup]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @GrpCNT = COUNT(*) FROM [dbo].[BusinessRulesGroup] WHERE (RuleGroup = @RuleGroup and GroupActive = 1) 
IF @GrpCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id:'+CONVERT(VARCHAR(18),@RuleGroup)+' is not set to Active Rule Group in [dbo].[BusinessRulesGroup]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @vRuleCNT = COUNT(*) FROM [dbo].[BusinessRules] WHERE RuleGroup = @RuleGroup 
IF @vRuleCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id: '+CONVERT(VARCHAR(18),@RuleGroup)+' does not have any rules in [dbo].[BusinessRules]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @vRuleCNT = COUNT(*) FROM [dbo].[BusinessRules] WHERE (RuleGroup = @RuleGroup and Active = 1) AND (GetDate() BETWEEN RuleStartDate AND RuleEndDate);
IF @vRuleCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id: '+CONVERT(VARCHAR(18),@RuleGroup)+' no active rules are set in [dbo].[BusinessRules]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,0);
PRINT @UpdateMsg;
RETURN;
END

-- Processing each rule
DECLARE cur CURSOR FOR
SELECT RuleId FROM [BRMS].[dbo].[BusinessRules] WHERE (RuleGroup = @RuleGroup and Active = 1) AND GetDate() BETWEEN RuleStartDate AND RuleEndDate ORDER BY RuleOrderBy ASC;
OPEN cur
FETCH NEXT FROM cur INTO @vRuleId
WHILE @@FETCH_STATUS = 0 BEGIN
EXEC  [dbo].[uspExectueRule]  @RuleId = @vRuleId, @OutputMsg = @UpdateMsg OUTPUT;
FETCH NEXT FROM cur INTO @vRuleId
END
CLOSE cur
DEALLOCATE cur

-- Report Rule Group Runtime
SET @UpdateMsg = 'Rule Group Id: '+@RuleGroup+' ran successfully';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@RuleGroup,@CNTSQL,@UpdateMsg,0);
END

GO
/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQL]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGenerateRuleSQL] 
@RuleId INT,
@vsql NVARCHAR(MAX) OUTPUT
AS 
BEGIN
DECLARE 
    @vDBTable NVARCHAR(MAX),
    @vTableName NVARCHAR(MAX),
	@vTableKey NVARCHAR(MAX),
    @vDBView NVARCHAR(MAX),
    @vViewName NVARCHAR(MAX),
    @vViewKey NVARCHAR(MAX),
    @vExpression NVARCHAR(MAX)

    DECLARE @RuleData TABLE (DBTable NVARCHAR(MAX), TableName NVARCHAR(MAX), TableKey NVARCHAR(MAX), DBView NVARCHAR(MAX), ViewName NVARCHAR(MAX), ViewKey NVARCHAR(MAX), RuleExpression NVARCHAR(MAX))

	INSERT INTO @RuleData
	SELECT TOP 1 A.[DBTable] ,A.[TableName] ,A.[TableKey] ,A.[DBView] ,A.[ViewName] ,A.[ViewKey],B.[RuleExpression] 
	FROM [dbo].[BusinessRulesGroup] as A INNER JOIN [dbo].[BusinessRules] as B ON A.[RuleGroup] = B.[RuleGroup] 
	WHERE B.[RuleId] = @Ruleid 
  
	SET @vDBTable = (SELECT DBTable FROM @RuleData)
	SET @vTableName = (SELECT TableName FROM @RuleData)
	SET @vTableKey = (SELECT TableKey FROM @RuleData)
	SET @vDBView = (SELECT DBView FROM @RuleData)
	SET @vViewName = (SELECT ViewName FROM @RuleData)
	SET @vViewKey = (SELECT ViewKey FROM @RuleData)
	SET @vExpression = (SELECT RuleExpression FROM @RuleData)

    SET @vsql = 'SELECT * FROM ' + @vDBView + '.' + @vViewName + ' AS vw ' + CHAR(13) + CHAR(10)
    SET @vsql += 'INNER JOIN ' + @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'ON ' + '[vw].' + @vViewKey + ' = ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBTable + '.' + @vTableName + '.' + @vTableKey + CHAR(13) + CHAR(10)
    SET @vsql += 'WHERE ' + @vExpression
	PRINT @vsql
END 
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQLCNT]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGenerateRuleSQLCNT] 
@RuleId INT,
@vCount INT OUTPUT
AS 
BEGIN
SET NOCOUNT ON;
DECLARE 
    @vDBTable NVARCHAR(MAX),
    @vTableName NVARCHAR(MAX),
	@vTableKey NVARCHAR(MAX),
    @vDBView NVARCHAR(MAX),
    @vViewName NVARCHAR(MAX),
    @vViewKey NVARCHAR(MAX),
    @vExpression NVARCHAR(MAX),
	@vsql NVARCHAR(MAX),
	@vCNT INT

    DECLARE @RuleData TABLE (DBTable NVARCHAR(MAX), TableName NVARCHAR(MAX), TableKey NVARCHAR(MAX), DBView NVARCHAR(MAX), ViewName NVARCHAR(MAX), ViewKey NVARCHAR(MAX), RuleExpression NVARCHAR(MAX))

	INSERT INTO @RuleData
	SELECT TOP 1 A.[DBTable] ,A.[TableName] ,A.[TableKey] ,A.[DBView] ,A.[ViewName] ,A.[ViewKey],B.[RuleExpression] 
	FROM [dbo].[BusinessRulesGroup] as A INNER JOIN [dbo].[BusinessRules] as B ON A.[RuleGroup] = B.[RuleGroup] 
	WHERE B.[RuleId] = @Ruleid 
  
	SET @vDBTable = (SELECT DBTable FROM @RuleData)
	SET @vTableName = (SELECT TableName FROM @RuleData)
	SET @vTableKey = (SELECT TableKey FROM @RuleData)
	SET @vDBView = (SELECT DBView FROM @RuleData)
	SET @vViewName = (SELECT ViewName FROM @RuleData)
	SET @vViewKey = (SELECT ViewKey FROM @RuleData)
	SET @vExpression = (SELECT RuleExpression FROM @RuleData)

    SET @vsql = 'SELECT COUNT(*) FROM ' + @vDBView + '.' + @vViewName + ' AS vw ' + CHAR(13) + CHAR(10)
    SET @vsql += 'INNER JOIN ' + @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'ON ' + '[vw].' + @vViewKey + ' = ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBTable + '.' + @vTableName + '.' + @vTableKey + CHAR(13) + CHAR(10)
    SET @vsql += 'WHERE ' + @vExpression

	DECLARE @Result TABLE (RCNT int)
	INSERT INTO @Result
	EXEC sp_executesql @vsql
	SELECT @vCount = RCNT FROM @Result

END 
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateRuleSQLUpdate]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGenerateRuleSQLUpdate] 
@RuleId INT,
@vsql NVARCHAR(MAX) OUTPUT
AS 
BEGIN
DECLARE 
    @vDBTable NVARCHAR(MAX),
    @vTableName NVARCHAR(MAX),
	@vTableKey NVARCHAR(MAX),
    @vDBView NVARCHAR(MAX),
    @vViewName NVARCHAR(MAX),
    @vViewKey NVARCHAR(MAX),
    @vSet NVARCHAR(MAX),
    @vExpression NVARCHAR(MAX)

    DECLARE @RuleData TABLE (DBTable NVARCHAR(MAX), TableName NVARCHAR(MAX), TableKey NVARCHAR(MAX), DBView NVARCHAR(MAX), ViewName NVARCHAR(MAX), ViewKey NVARCHAR(MAX), RuleExpression NVARCHAR(MAX), RuleSetCommand NVARCHAR(MAX))

	INSERT INTO @RuleData
	SELECT TOP 1 A.[DBTable] ,A.[TableName] ,A.[TableKey] ,A.[DBView] ,A.[ViewName] ,A.[ViewKey],B.[RuleExpression], B.[RuleSetCommand] 
	FROM [dbo].[BusinessRulesGroup] as A INNER JOIN [dbo].[BusinessRules] as B ON A.[RuleGroup] = B.[RuleGroup]
	WHERE B.[RuleId] = @Ruleid 
  
	SET @vDBTable = (SELECT DBTable FROM @RuleData)
	SET @vTableName = (SELECT TableName FROM @RuleData)
	SET @vTableKey = (SELECT TableKey FROM @RuleData)
	SET @vDBView = (SELECT DBView FROM @RuleData)
	SET @vViewName = (SELECT ViewName FROM @RuleData)
	SET @vViewKey = (SELECT ViewKey FROM @RuleData)
	SET @vSet = (SELECT RuleSetCommand FROM @RuleData)
	SET @vExpression = (SELECT RuleExpression FROM @RuleData)

    SET @vsql = 'UPDATE ' + @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'SET ' + @vSet + CHAR(13) + CHAR(10)
    SET @vsql += 'FROM ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'INNER JOIN ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBView + '.' + @vViewName + ' AS vw ' + CHAR(13) + CHAR(10)
    SET @vsql += 'ON ' + @vDBTable + '.' + @vTableName + '.' + @vTableKey + ' = ' + CHAR(13) + CHAR(10)
    SET @vsql += '[vw].' + @vViewKey + ' ' + CHAR(13) + CHAR(10)
    SET @vsql += 'WHERE ' + @vExpression
	--PRINT @vsql
END 
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateSQL]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspGenerateSQL]
    @vDBView NVARCHAR(MAX),
    @vViewName NVARCHAR(MAX),
    @vDBTable NVARCHAR(MAX),
    @vTableName NVARCHAR(MAX),
    @vViewKey NVARCHAR(MAX),
    @vTableKey NVARCHAR(MAX),
    @vExpression NVARCHAR(MAX),
    @vsql NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @vsql = 'SELECT * FROM ' + @vDBView + '.' + @vViewName + ' AS vw ' + CHAR(13) + CHAR(10)
    SET @vsql += 'INNER JOIN ' + @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'ON ' + '[vw].' + @vViewKey + ' = ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBTable + '.' + @vTableName + '.' + @vTableKey + CHAR(13) + CHAR(10)
    SET @vsql += 'WHERE ' + @vExpression
	PRINT @vsql
END

GO
/****** Object:  StoredProcedure [dbo].[uspGenerateSQLUpdate]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspGenerateSQLUpdate]
    @vDBTable NVARCHAR(MAX),
    @vTableName NVARCHAR(MAX),
    @vTableKey NVARCHAR(MAX),
    @vDBView NVARCHAR(MAX),
    @vViewName NVARCHAR(MAX),
    @vViewKey NVARCHAR(MAX),
    @vSet NVARCHAR(MAX),
    @vExpression NVARCHAR(MAX),
    @vsql NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @vsql = 'UPDATE ' + @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'SET ' + @vSet + CHAR(13) + CHAR(10)
    SET @vsql += 'FROM ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBTable + '.' + @vTableName + CHAR(13) + CHAR(10)
    SET @vsql += 'INNER JOIN ' + CHAR(13) + CHAR(10)
    SET @vsql += @vDBView + '.' + @vViewName + ' AS vw ' + CHAR(13) + CHAR(10)
    SET @vsql += 'ON ' + @vDBTable + '.' + @vTableName + '.' + @vTableKey + ' = ' + CHAR(13) + CHAR(10)
    SET @vsql += '[vw].' + @vViewKey + ' ' + CHAR(13) + CHAR(10)
    SET @vsql += 'WHERE ' + @vExpression
	PRINT @vsql
END



GO
/****** Object:  StoredProcedure [dbo].[uspList_Database]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspList_Database]
AS
BEGIN
SELECT '['+[name]+']' AS [Database] FROM Sys.sysdatabases
-- Add any additional database you would like to hide.
WHERE [name] NOT IN ('master','tempdb','model','msdb','ReportServer','RedGateMonitor','ApexSQLBIMonitor','ApexSQLCrd', 'BRMS')
AND [name] NOT LIKE 'ArchiveCrd_%'
END
GO
/****** Object:  StoredProcedure [dbo].[uspList_Tables]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspList_Tables](@DatabaseName AS NVARCHAR(150)) AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
SET @sql = 'SELECT ''[''+[TABLE_CATALOG] + ''].['' + [TABLE_SCHEMA] + ''].['' + [TABLE_NAME] +'']'' as [Tables],'''+@DatabaseName+''''+' as DB FROM 
' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.INFORMATION_SCHEMA.Tables'+
' WHERE  [TABLE_TYPE] = ''BASE TABLE'' and [TABLE_NAME] <> ''sysdiagrams'''+
' ORDER BY [TABLE_SCHEMA], [TABLE_NAME]'
EXECUTE(@sql)

END  
GO
/****** Object:  StoredProcedure [dbo].[uspList_TablesColumns]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspList_TablesColumns](@DatabaseName AS NVARCHAR(150),@TableName AS NVARCHAR(150)) AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
DECLARE @TN AS Nvarchar(150)
--DECLARE @DatabaseName nvarchar(150) = 'AdventureWorks2019'
--DECLARE @TableName nvarchar(150) ='Purchasing.Vendor'
SET @TN = @TableName
SET @TableName = REPLACE(REPLACE(QUOTENAME(@TableName),'[',''),']','')
SET @TableName = SUBSTRING(@TableName, LEN(@TableName) -  CHARINDEX('.',REVERSE(@TableName)) + 2, LEN(@TableName))
SET @sql = 'SELECT  '+'''[''+'+'col.name'+'+'']'''+' AS ColumnName,'''+@DatabaseName+''''+' as DB,'''+@TN+''''+' as TN, ty.name as DataType '+ 
' FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.sys.tables as tab '+
' INNER JOIN  '+@DatabaseName+'.sys.columns as col ON tab.object_id = col.object_id'+
' INNER JOIN  '+@DatabaseName+'.sys.types as t ON col.user_type_id = t.user_type_id '+
' INNER JOIN sys.types ty ON col.system_type_id = ty.system_type_id' +
' WHERE  tab.name= '''+ @TableName +''''+ 'AND ty.name <> ''sysname''' +
' ORDER BY [ColumnName]'
PRINT(@sql)
EXECUTE(@sql)

END  
GO
/****** Object:  StoredProcedure [dbo].[uspList_TablesColumnType]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspList_TablesColumnType](@DatabaseName AS NVARCHAR(150),@TableName AS NVARCHAR(150), @ColumnName AS NVARCHAR(150)) AS  
BEGIN  
DECLARE @sql NVARCHAR(800)
DECLARE @TN AS Nvarchar(150)
--DECLARE @DatabaseName nvarchar(150) = 'AdventureWorks2019'
--DECLARE @TableName nvarchar(150) ='Purchasing.Vendor'
--DECLARE @ColumnName nvarchar(150) = '[Name]'
SET @TN = @TableName
SET @TableName = REPLACE(REPLACE(QUOTENAME(@TableName),'[',''),']','')
SET @TableName = SUBSTRING(@TableName, LEN(@TableName) -  CHARINDEX('.',REVERSE(@TableName)) + 2, LEN(@TableName))
SET @sql = 'SELECT ty.name as DataType '+ 
' FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.sys.tables as tab '+
' INNER JOIN  '+@DatabaseName+'.sys.columns as col ON tab.object_id = col.object_id'+
' INNER JOIN  '+@DatabaseName+'.sys.types as t ON col.user_type_id = t.user_type_id '+
' INNER JOIN sys.types ty ON col.system_type_id = ty.system_type_id' +
' WHERE  tab.name= '''+ @TableName +''''+ 'AND ty.name <> ''sysname'' AND col.name = '''+Replace(Replace(@ColumnName,'[',''),']','')+''''
PRINT(@sql)
EXECUTE(@sql)
END  
GO
/****** Object:  StoredProcedure [dbo].[uspList_Views]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[uspList_Views](@DatabaseName AS NVARCHAR(150))
AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
SET @sql = 'SELECT ''[''+[TABLE_CATALOG] + ''].['' + [TABLE_SCHEMA] + ''].['' + [TABLE_NAME] +'']'' as [Views],'''+@DatabaseName+''''+' as DB FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.INFORMATION_SCHEMA.Views'+
' ORDER BY [TABLE_SCHEMA], [TABLE_NAME]'
EXECUTE(@sql)

END  
GO
/****** Object:  StoredProcedure [dbo].[uspList_ViewsColumns]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspList_ViewsColumns](@DatabaseName AS NVARCHAR(150),@ViewName AS NVARCHAR(150))
AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
DECLARE @VN AS Nvarchar(150)
--DECLARE @DatabaseName nvarchar(150) = 'AdventureWorks2019'
--DECLARE @ViewName nvarchar(150) ='Purchasing.vVendorWithContacts'
SET @VN = @ViewName
SET @ViewName = REPLACE(REPLACE(QUOTENAME(@ViewName),'[',''),']','')
SET @ViewName = SUBSTRING(@ViewName, LEN(@ViewName) -  CHARINDEX('.',REVERSE(@ViewName)) + 2  , LEN(@ViewName))
SET @sql = 'SELECT '+'''[''+'+'col.name'+'+'']'''+' AS ColumnName,'''+@DatabaseName+''''+' as DB,'''+@VN+''''+' as VN, ty.name as DataType '+ 
' FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.sys.views as tab '+
' INNER JOIN '+@DatabaseName+'.sys.columns as col ON tab.object_id = col.object_id'+
' INNER JOIN '+@DatabaseName+'.sys.types as t ON col.user_type_id = t.user_type_id '+
' INNER JOIN sys.types ty ON col.system_type_id = ty.system_type_id' +
' WHERE  tab.name= '''+ @ViewName +''''+ 'AND ty.name <> ''sysname''' +
' ORDER BY [ColumnName]'
PRINT(@sql)
EXECUTE(@sql)

END  
GO
/****** Object:  StoredProcedure [dbo].[uspList_ViewsColumnType]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspList_ViewsColumnType](@DatabaseName AS NVARCHAR(150),@ViewName AS NVARCHAR(150), @ColumnName AS NVARCHAR(150)) AS  
BEGIN  
DECLARE @sql NVARCHAR(800)
DECLARE @VN AS Nvarchar(150)
--DECLARE @DatabaseName nvarchar(150) = 'AdventureWorks2019'
--DECLARE @ViewName nvarchar(150) ='Purchasing.vVendorWithContacts'
--DECLARE @ColumnName nvarchar(150) = '[Name]'
SET @VN = @ViewName
SET @ViewName = REPLACE(REPLACE(QUOTENAME(@ViewName),'[',''),']','')
SET @ViewName = SUBSTRING(@ViewName, LEN(@ViewName) -  CHARINDEX('.',REVERSE(@ViewName)) + 2  , LEN(@ViewName))
SET @sql = 'SELECT ty.name as DataType '+ 
' FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.sys.views as tab '+
' INNER JOIN '+@DatabaseName+'.sys.columns as col ON tab.object_id = col.object_id'+
' INNER JOIN '+@DatabaseName+'.sys.types as t ON col.user_type_id = t.user_type_id '+
' INNER JOIN sys.types ty ON col.system_type_id = ty.system_type_id' +
' WHERE  tab.name= '''+ @ViewName +''''+ 'AND ty.name <> ''sysname'' AND col.name = '''+Replace(Replace(@ColumnName,'[',''),']','')+''''
PRINT(@sql)
EXECUTE(@sql)

END  
GO
/****** Object:  StoredProcedure [dbo].[uspRuleAddUpdate]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[uspRuleAddUpdate](
@RuleId as int,@RuleGroup as int,@RuleExpression as nvarchar(MAX),@RuleSetCommand as nvarchar(MAX),
@RuleTitle as nvarchar(200),@RuleStartDate as date,@RuleEndDate as date,@Active as bit,@StatusMsg AS VARCHAR(MAX) OUTPUT) AS
BEGIN
DECLARE @RCNT AS INT,@GCNT AS INT, @TCNT AS INT, @RuleOrderBy AS INT;

-- INPUT CHECKING...
IF @RuleId <> 0
BEGIN
SELECT @RCNT=Count(*), @RuleOrderBy = ISNULL(MAX(RuleOrderBy),1) FROM dbo.BusinessRules WHERE RuleId = @RuleId
END 

IF @RuleId = 0 --Get the Max Order by for that group during Insert
BEGIN
SELECT @RuleOrderBy = ISNULL(MAX(RuleOrderBy),1) FROM BusinessRules WHERE [RuleGroup] = @RuleGroup AND RuleId = @RuleId 
END 

IF @RCNT = 0 and @RuleId <> 0
BEGIN
SET @StatusMsg = 'Cannot find Rule ID:' + Convert(nvarchar(18),@RuleId) + ' to update in dbo.BusinessRules'
PRINT @StatusMsg; 
RETURN;
END

SELECT @GCNT=Count(*) FROM dbo.BusinessRulesGroup WHERE RuleGroup = @RuleGroup 
IF @GCNT = 0
BEGIN
SET @StatusMsg = 'Cannot find Rule Group ID:' + Convert(nvarchar(18),@RuleGroup) + ' in dbo.BusinessRulesGroup '
PRINT @StatusMsg; 
RETURN;
END

SELECT @TCNT=Count(*) FROM dbo.BusinessRules WHERE RuleGroup = @RuleGroup AND RuleTitle = @RuleTitle AND RuleId <> @RuleId
IF @TCNT >= 1 
BEGIN
SET @StatusMsg = 'Rule Title already in use in this Rule Group: ' + @RuleTitle
PRINT @StatusMsg; 
RETURN;
END

IF @Active = 0 
BEGIN
SET @RuleOrderBy = 999999
END

------------------ COMMIT CHANGES
BEGIN TRY
    IF @RuleId = 0  -- Insert Rule in dbo.BusinessRules
    BEGIN
        INSERT INTO dbo.BusinessRules (RuleGroup, RuleOrderBy, RuleExpression, RuleSetCommand, RuleTitle, RuleStartDate, RuleEndDate, Active)
        VALUES (@RuleGroup, @RuleOrderBy, @RuleExpression, @RuleSetCommand, @RuleTitle, @RuleStartDate, @RuleEndDate, @Active)
        SET @StatusMsg = 'Success'
        PRINT @StatusMsg;
		EXEC dbo.uspRuleOrderFix;
        RETURN;
    END
END TRY
BEGIN CATCH
    SET @StatusMsg = 'Error on Insert: ' + ERROR_MESSAGE()
    PRINT @StatusMsg
END CATCH

BEGIN TRY
IF @RuleId <> 0 -- Update Rule in dbo.BusinessRules
	BEGIN
		UPDATE dbo.BusinessRules
		SET RuleGroup = @RuleGroup, RuleOrderBy = @RuleOrderBy, RuleExpression = @RuleExpression, RuleSetCommand = @RuleSetCommand, RuleTitle = @RuleTitle, 
		RuleStartDate = @RuleStartDate, RuleEndDate = @RuleEndDate, Active = @Active
		WHERE RuleId = @RuleId
		SET @StatusMsg = 'Success'
		PRINT @StatusMsg;
		EXEC dbo.uspRuleOrderFix;
		RETURN;
	END
END TRY
BEGIN CATCH
    SET @StatusMsg = 'Error on Update: ' + ERROR_MESSAGE()
    PRINT @StatusMsg
END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[uspRuleGroupMaxOrder]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspRuleGroupMaxOrder] AS
BEGIN
SET NOCOUNT ON

SELECT ISNULL(MAX(GroupOrderBy),0) AS LastOrderBy
FROM BusinessRulesGroup
WHERE GroupOrderBy <> 999999
END


GO
/****** Object:  StoredProcedure [dbo].[uspRuleGroupOrderFix]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspRuleGroupOrderFix]
AS
SET NOCOUNT ON
DECLARE @ReOrder int 
DECLARE @id int 
DECLARE @MyCursor CURSOR
DECLARE @Link varchar(18) 
DECLARE @UpdateCursor CURSOR
Set @MyCursor = CURSOR FOR Select Distinct RuleGroup  From BusinessRulesGroup Where GroupOrderBy <> 999999

OPEN @MyCursor
FETCH NEXT FROM @MyCursor into @Link

WHILE @@FETCH_STATUS = 0
BEGIN
Set @UpdateCursor = CURSOR FOR Select TOP (999999) RuleGroup From BusinessRulesGroup WHERE  GroupOrderBy <> 999999 order by GroupOrderBy  ASC
OPEN @UpdateCursor

FETCH NEXT FROM  @UpdateCursor into @id
Set @ReOrder = 0
WHILE @@FETCH_STATUS = 0
BEGIN
UPDATE BusinessRulesGroup
SET  @ReOrder= GroupOrderBy  = @ReOrder + 1
WHERE RuleGroup = @id
FETCH NEXT 
FROM @UpdateCursor INTO @id
END
CLOSE @UpdateCursor
DEALLOCATE @UpdateCursor

FETCH NEXT 
FROM @MyCursor INTO @Link
END

CLOSE @MyCursor
DEALLOCATE @MyCursor
GO
/****** Object:  StoredProcedure [dbo].[uspRuleGroupRecInsert]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspRuleGroupRecInsert] 
(
  @RuleGroupName nvarchar(60),
  @DBTable nvarchar(150),
  @TableName nvarchar(150),
  @TableKey nvarchar(150),
  @DBView nvarchar(150),
  @ViewName nvarchar(150),
  @ViewKey nvarchar(150),
  @GroupActive bit
)
AS
BEGIN
 INSERT INTO [dbo].[BusinessRulesGroup]
 ([RuleGroupName], [DBTable], [TableName], [TableKey], [DBView], [ViewName], [ViewKey], [GroupActive], [GroupOrderBy])
  VALUES
  (
  @RuleGroupName, @DBTable ,@TableName ,@TableKey ,@DBView ,@ViewName,@ViewKey,@GroupActive,
  CASE WHEN @GroupActive = 1 THEN (SELECT TOP 1 ISNULL(MAX(GroupOrderBy),0)+1 GroupOrderBy FROM BusinessRulesGroup WHERE GroupOrderBy <> 999999) 
  ELSE 999999 END
  );
  EXEC dbo.uspRuleGroupOrderFix;
END

GO
/****** Object:  StoredProcedure [dbo].[uspRuleGroupRecUpdate]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspRuleGroupRecUpdate] 
(
  @RuleGroup int,
  @RuleGroupName nvarchar(60),
  @DBTable nvarchar(150),
  @TableName nvarchar(150),
  @TableKey nvarchar(150),
  @DBView nvarchar(150),
  @ViewName nvarchar(150),
  @ViewKey nvarchar(150),
  @GroupActive bit
)
AS
BEGIN

DECLARE 
@ChkActive bit,
@ChkOrderBy int
SELECT @ChkActive = GroupActive,@ChkOrderBy =[GroupOrderBy] FROM [dbo].[BusinessRulesGroup] WHERE RuleGroup = @RuleGroup 
IF (@GroupActive = 0) SET @ChkOrderBy = 999999
IF (@GroupActive = 1 and @ChkActive = 0) SET @ChkOrderBy = (SELECT TOP 1 ISNULL(MAX(GroupOrderBy),0)+1 AS GroupOrderBy FROM BusinessRulesGroup WHERE GroupOrderBy <> 999999) 

 UPDATE [dbo].[BusinessRulesGroup]
 SET 
 [RuleGroupName] = @RuleGroupName, 
 [DBTable] = @DBTable, 
 [TableName] = @TableName, 
 [TableKey] = @TableKey, 
 [DBView] = @DBView, 
 [ViewName] = @ViewName, 
 [ViewKey] = @ViewKey, 
 [GroupActive] = @GroupActive, 
 [GroupOrderBy] = @ChkOrderBy
 WHERE RuleGroup = @RuleGroup;
 
 EXEC dbo.uspRuleGroupOrderFix;

END

GO
/****** Object:  StoredProcedure [dbo].[uspRuleGroupReorder]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspRuleGroupReorder] (@newOrder INT, @Groupid INT) AS
SET NOCOUNT ON

DECLARE @oldOrder INT
SELECT @oldOrder = GroupOrderBy
FROM BusinessRulesGroup
WHERE [RuleGroup] = @Groupid 

UPDATE BusinessRulesGroup
SET GroupOrderBy = @newOrder
WHERE [RuleGroup] = @Groupid AND GroupOrderBy <> 999999

IF @newOrder < @oldOrder -- moving up
BEGIN
UPDATE BusinessRulesGroup
SET GroupOrderBy = GroupOrderBy + 1
WHERE ([RuleGroup] <> @Groupid) AND GroupOrderBy BETWEEN @newOrder AND @oldOrder
AND GroupOrderBy <> 999999
END

ELSE IF @newOrder <> 1 -- moving down
BEGIN
UPDATE BusinessRulesGroup
SET GroupOrderBy = GroupOrderBy - 1
WHERE ([RuleGroup] <> @Groupid ) AND GroupOrderBy BETWEEN @oldOrder AND @newOrder 
AND GroupOrderBy <> 999999;
END
exec dbo.uspRuleGroupOrderFix;
GO
/****** Object:  StoredProcedure [dbo].[uspRuleLogHistory]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspRuleLogHistory](@RuleStarted AS varchar(10),@RuleEnded AS varchar(10), @RuleGroupName as nvarchar(60)) AS  
BEGIN  
DECLARE @sql NVARCHAR(1000)
DECLARE @fsql NVARCHAR(300)
SET @fsql = ''

	IF (@RuleGroupName <> 'All Groups' AND @RuleGroupName <> '')
	BEGIN
	SET @fsql = ' AND RuleGroupName ='''+ @RuleGroupName+''''
	END 

SET @sql = 'SELECT A.LogId, C.RuleGroupName, A.RuleId, B.RuleTitle, A.Message, A.RuleStarted, A.RuleEnded,A.RowsAffected, A.Failed '+ 
' FROM	BusinessRuleLog AS A INNER JOIN BusinessRules AS B ON A.RuleId = B.RuleId '+
' INNER JOIN dbo.BusinessRulesGroup AS C ON B.RuleGroup	= C.RuleGroup'+
' WHERE (A.RuleStarted >= '''+@RuleStarted+''''+ ' AND '''+@RuleEnded+' 23:59:59.9'''+' >= A.RuleEnded ) '+ @fsql +' ORDER BY A.RuleStarted DESC'
PRINT(@sql)
EXECUTE(@sql)
END  
GO
/****** Object:  StoredProcedure [dbo].[uspRuleMaxOrder]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspRuleMaxOrder]
@Groupid INT
AS
BEGIN
SET NOCOUNT ON

SELECT ISNULL(MAX(RuleOrderBy),0) AS LastOrderBy
FROM BusinessRules
WHERE [Active] = 1 AND [RuleGroup] = @Groupid AND [RuleOrderBy] <> 999999
END


GO
/****** Object:  StoredProcedure [dbo].[uspRuleOrderFix]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspRuleOrderFix] AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ReOrder INT; 
    DECLARE @RuleId INT; 
    DECLARE @RuleGrpId INT; 
	DECLARE @MaxRuleInGrp INT;
    DECLARE @MyCursor CURSOR;
    DECLARE @Link VARCHAR(18); 
    DECLARE @UpdateCursor CURSOR;

    UPDATE dbo.BusinessRules SET RuleOrderBy = 999998 WHERE [Active] = 1 AND [RuleOrderBy] = 999999;

    SET @MyCursor = CURSOR FOR 
    SELECT DISTINCT RuleGroup FROM BusinessRules WHERE RuleOrderBy <> 999999

    OPEN @MyCursor
    FETCH NEXT FROM @MyCursor INTO @RuleGrpId

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @UpdateCursor = CURSOR FOR 
        SELECT TOP (999999) RuleId FROM BusinessRules WHERE RuleOrderBy <> 999999 AND RuleGroup = @RuleGrpId ORDER BY RuleOrderBy ASC

		SELECT @MaxRuleInGrp = Max(RuleOrderBy) FROM BusinessRules WHERE RuleOrderBy <> 999999 AND RuleGroup = @RuleGrpId
		PRINT Convert(varchar(18),@MaxRuleInGrp)

        OPEN @UpdateCursor
        FETCH NEXT FROM @UpdateCursor INTO @RuleId
        SET @ReOrder = 0

        WHILE @@FETCH_STATUS = 0
        BEGIN
		        IF @ReOrder < @MaxRuleInGrp
			BEGIN
				UPDATE BusinessRules
				SET  @ReOrder= RuleOrderBy  = @ReOrder + 1
				WHERE RuleId = @RuleId
				FETCH NEXT FROM @UpdateCursor INTO @RuleId
			END
        END

        CLOSE @UpdateCursor
        DEALLOCATE @UpdateCursor

        FETCH NEXT FROM @MyCursor INTO @RuleGrpId
    END

    CLOSE @MyCursor
    DEALLOCATE @MyCursor
END


GO
/****** Object:  StoredProcedure [dbo].[uspRuleReorder]    Script Date: 2023-01-22 6:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[uspRuleReorder]
@Ruleid INT,
@newOrder INT,
@Groupid INT
AS

SET NOCOUNT ON

DECLARE @oldOrder INT
SELECT @oldOrder = RuleOrderBy
FROM BusinessRules
WHERE [RuleGroup] = @Groupid AND RuleId = @Ruleid AND RuleOrderBy <> 999999

UPDATE BusinessRules
SET RuleOrderBy = @newOrder
WHERE [RuleGroup] = @Groupid AND RuleId = @Ruleid  AND RuleOrderBy <> 999999

IF @newOrder < @oldOrder -- moving up
BEGIN
UPDATE BusinessRules
SET RuleOrderBy = RuleOrderBy + 1
WHERE ([RuleGroup] = @Groupid) AND RuleOrderBy BETWEEN @newOrder AND @oldOrder
AND RuleId <> @Ruleid  AND RuleOrderBy <> 999999
END

ELSE IF @newOrder <> 1 -- moving down
BEGIN
UPDATE BusinessRules
SET RuleOrderBy = RuleOrderBy - 1
WHERE ([RuleGroup] = @Groupid) AND RuleOrderBy BETWEEN @oldOrder AND @newOrder
AND RuleId <> @Ruleid  AND RuleOrderBy <> 999999
END

EXEC dbo.uspRuleOrderFix;



GO
USE [master]
GO
ALTER DATABASE [BRMS] SET  READ_WRITE 
GO
