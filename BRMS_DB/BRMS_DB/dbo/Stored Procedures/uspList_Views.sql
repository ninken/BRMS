CREATE PROCEDURE [dbo].[uspList_Views](@DatabaseName AS NVARCHAR(150))
AS  
BEGIN  
DECLARE @sql NVARCHAR(500)
SET @sql = 'SELECT ''[''+[TABLE_CATALOG] + ''].['' + [TABLE_SCHEMA] + ''].['' + [TABLE_NAME] +'']'' as [Views],'''+@DatabaseName+''''+' as DB FROM ' + REPLACE(REPLACE(QUOTENAME(@DatabaseName),'[',''),']','') + '.INFORMATION_SCHEMA.Views'+
' ORDER BY [TABLE_SCHEMA], [TABLE_NAME]'
EXECUTE(@sql)

END