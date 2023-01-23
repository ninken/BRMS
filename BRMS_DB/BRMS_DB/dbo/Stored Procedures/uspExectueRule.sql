CREATE PROCEDURE [dbo].[uspExectueRule]  @RuleId INT, @OutputMsg NVARCHAR(1000) OUTPUT AS 
BEGIN
SET NOCOUNT ON
DECLARE @CNTSQL INT,@DTStart DateTime,@DTEnd DateTime, @GrpCNT INT,@vRuleCNT INT,@vRuleId INT,@GotSQL NVARCHAR(MAX),@UpdateMsg NVARCHAR(1000)
SET @OutputMsg = 'Not processed';
Set @DTStart = GetDate();

-- ERROR CHECKS
SELECT @vRuleId  = IsNull(RuleId,0) FROM [BRMS].[dbo].[BusinessRules] WHERE RuleId = @RuleId
IF @vRuleId <> @RuleId
BEGIN
PRINT 'Rule Id does not exists: '+ convert(varchar(18),@RuleId);
RETURN
END 

SELECT @vRuleId = IsNull(RuleId,0) FROM [BRMS].[dbo].[BusinessRules] WHERE (RuleId = @RuleId and Active = 1) AND GetDate() BETWEEN RuleStartDate AND RuleEndDate ORDER BY RuleOrderBy ASC;
IF @vRuleId <> @RuleId
BEGIN
PRINT 'Rule Id: '+ convert(varchar(18),@RuleId) +' is not active or expired' ;
RETURN
END 

EXECUTE [dbo].[uspGenerateRuleSQLCNT] @RuleId = @vRuleId, @vCount = @CNTSQL OUTPUT;

IF @CNTSQL = 0
BEGIN
SET @UpdateMsg = 'Rule Id:'+CONVERT(VARCHAR(18),@RuleId)+' has 0 records to update / is not active or has expired.'
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,0,@UpdateMsg,0);
SET @OutputMsg = 'No records';
END 

IF @CNTSQL <> 0
BEGIN
EXECUTE [dbo].[uspGenerateRuleSQLUpdate] @RuleId = @vRuleId, @vsql = @GotSQL OUTPUT
BEGIN TRY
BEGIN TRANSACTION
EXEC sp_executesql @GotSQL
SET @CNTSQL = @@ROWCOUNT
COMMIT TRANSACTION
SET @UpdateMsg = 'Successfully updated';
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION
SET @UpdateMsg = 'UPDATE ERROR: ' + ERROR_MESSAGE()
END
END CATCH
END 


IF (@UpdateMsg = 'Successfully updated')
BEGIN
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,@CNTSQL,'Successfully updated',0);
SET @OutputMsg = 'Success';
END 

IF (@UpdateMsg like 'UPDATE ERROR:%')
BEGIN
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@vRuleId,@CNTSQL,IsNull(@UpdateMsg,'UPDATE ERROR'),-1);
SET @OutputMsg = 'Failed';
END 

END