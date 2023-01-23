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