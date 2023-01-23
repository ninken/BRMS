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