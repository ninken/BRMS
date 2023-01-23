CREATE FUNCTION	[dbo].[GetCurrentUser]()
RETURNS nvarchar(50)
AS
BEGIN
DECLARE @RUser nvarchar(50)
SET @RUser = Left(RIGHT(IsNull(SUSER_NAME(), (CHARINDEX('\', REVERSE(SUSER_NAME()), 1))-1),'5'),50)

Return(@RUser)
END