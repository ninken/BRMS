CREATE PROCEDURE [dbo].[uspList_Tables](@DatabaseName AS NVARCHAR(150)) AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
SET @sql = 'SELECT ''[''+[TABLE_CATALOG] + ''].['' + [TABLE_SCHEMA] + ''].['' + [TABLE_NAME] +'']'' as [Tables],'''+@DatabaseName+''''+' as DB FROM 
' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.INFORMATION_SCHEMA.Tables'+
' WHERE  [TABLE_TYPE] = ''BASE TABLE'' and [TABLE_NAME] <> ''sysdiagrams'''+
' ORDER BY [TABLE_SCHEMA], [TABLE_NAME]'
EXECUTE(@sql)

END