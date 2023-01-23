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