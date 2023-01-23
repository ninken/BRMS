﻿CREATE PROCEDURE [dbo].[uspGenerateRuleSQL] 
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