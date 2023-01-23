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