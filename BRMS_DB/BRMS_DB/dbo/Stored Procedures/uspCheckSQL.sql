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