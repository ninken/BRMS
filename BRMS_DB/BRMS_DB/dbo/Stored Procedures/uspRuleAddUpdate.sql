CREATE PROCEDURE [dbo].[uspRuleAddUpdate](
@RuleId as int,@RuleGroup as int,@RuleExpression as nvarchar(MAX),@RuleSetCommand as nvarchar(MAX),
@RuleTitle as nvarchar(200),@RuleStartDate as date,@RuleEndDate as date,@Active as bit,@StatusMsg AS VARCHAR(MAX) OUTPUT) AS
BEGIN
DECLARE @RCNT AS INT,@GCNT AS INT, @TCNT AS INT, @RuleOrderBy AS INT;

-- INPUT CHECKING...
IF @RuleId <> 0
BEGIN
SELECT @RCNT=Count(*), @RuleOrderBy = ISNULL(MAX(RuleOrderBy),1) FROM dbo.BusinessRules WHERE RuleId = @RuleId
END 

IF @RuleId = 0 --Get the Max Order by for that group during Insert
BEGIN
SELECT @RuleOrderBy = ISNULL(MAX(RuleOrderBy),1) FROM BusinessRules WHERE [RuleGroup] = @RuleGroup AND RuleId = @RuleId 
END 

IF @RCNT = 0 and @RuleId <> 0
BEGIN
SET @StatusMsg = 'Cannot find Rule ID:' + Convert(nvarchar(18),@RuleId) + ' to update in dbo.BusinessRules'
PRINT @StatusMsg; 
RETURN;
END

SELECT @GCNT=Count(*) FROM dbo.BusinessRulesGroup WHERE RuleGroup = @RuleGroup 
IF @GCNT = 0
BEGIN
SET @StatusMsg = 'Cannot find Rule Group ID:' + Convert(nvarchar(18),@RuleGroup) + ' in dbo.BusinessRulesGroup '
PRINT @StatusMsg; 
RETURN;
END

SELECT @TCNT=Count(*) FROM dbo.BusinessRules WHERE RuleGroup = @RuleGroup AND RuleTitle = @RuleTitle AND RuleId <> @RuleId
IF @TCNT >= 1 
BEGIN
SET @StatusMsg = 'Rule Title already in use in this Rule Group: ' + @RuleTitle
PRINT @StatusMsg; 
RETURN;
END

IF @Active = 0 
BEGIN
SET @RuleOrderBy = 999999
END

------------------ COMMIT CHANGES
BEGIN TRY
    IF @RuleId = 0  -- Insert Rule in dbo.BusinessRules
    BEGIN
        INSERT INTO dbo.BusinessRules (RuleGroup, RuleOrderBy, RuleExpression, RuleSetCommand, RuleTitle, RuleStartDate, RuleEndDate, Active)
        VALUES (@RuleGroup, @RuleOrderBy, @RuleExpression, @RuleSetCommand, @RuleTitle, @RuleStartDate, @RuleEndDate, @Active)
        SET @StatusMsg = 'Success'
        PRINT @StatusMsg;
		EXEC dbo.uspRuleOrderFix;
        RETURN;
    END
END TRY
BEGIN CATCH
    SET @StatusMsg = 'Error on Insert: ' + ERROR_MESSAGE()
    PRINT @StatusMsg
END CATCH

BEGIN TRY
IF @RuleId <> 0 -- Update Rule in dbo.BusinessRules
	BEGIN
		UPDATE dbo.BusinessRules
		SET RuleGroup = @RuleGroup, RuleOrderBy = @RuleOrderBy, RuleExpression = @RuleExpression, RuleSetCommand = @RuleSetCommand, RuleTitle = @RuleTitle, 
		RuleStartDate = @RuleStartDate, RuleEndDate = @RuleEndDate, Active = @Active
		WHERE RuleId = @RuleId
		SET @StatusMsg = 'Success'
		PRINT @StatusMsg;
		EXEC dbo.uspRuleOrderFix;
		RETURN;
	END
END TRY
BEGIN CATCH
    SET @StatusMsg = 'Error on Update: ' + ERROR_MESSAGE()
    PRINT @StatusMsg
END CATCH
END