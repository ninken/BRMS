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