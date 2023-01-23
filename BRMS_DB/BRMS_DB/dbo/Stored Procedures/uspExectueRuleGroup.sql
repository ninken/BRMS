CREATE PROCEDURE [dbo].[uspExectueRuleGroup]  @RuleGroup INT AS 
BEGIN
SET NOCOUNT ON
DECLARE @CNTSQL INT,@DTStart DateTime,@DTEnd DateTime, @GrpCNT INT,@vRuleCNT INT,@IsGrpActive BIT,@vRuleId INT,@GotSQL NVARCHAR(MAX),@UpdateMsg NVARCHAR(1000)
SET @DTStart = Getdate()

-- ERROR CHECKS
SELECT @GrpCNT = COUNT(*) FROM [dbo].[BusinessRulesGroup] WHERE RuleGroup = @RuleGroup
IF @GrpCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id:'+CONVERT(VARCHAR(18),@RuleGroup)+' does not exists in [dbo].[BusinessRulesGroup]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @GrpCNT = COUNT(*) FROM [dbo].[BusinessRulesGroup] WHERE (RuleGroup = @RuleGroup and GroupActive = 1) 
IF @GrpCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id:'+CONVERT(VARCHAR(18),@RuleGroup)+' is not set to Active Rule Group in [dbo].[BusinessRulesGroup]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @vRuleCNT = COUNT(*) FROM [dbo].[BusinessRules] WHERE RuleGroup = @RuleGroup 
IF @vRuleCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id: '+CONVERT(VARCHAR(18),@RuleGroup)+' does not have any rules in [dbo].[BusinessRules]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,-1);
PRINT @UpdateMsg;
RETURN;
END

SELECT @vRuleCNT = COUNT(*) FROM [dbo].[BusinessRules] WHERE (RuleGroup = @RuleGroup and Active = 1) AND (GetDate() BETWEEN RuleStartDate AND RuleEndDate);
IF @vRuleCNT = 0
BEGIN
SET @UpdateMsg = 'Rule Group Id: '+CONVERT(VARCHAR(18),@RuleGroup)+' no active rules are set in [dbo].[BusinessRules]';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (GetDate(),GetDate(),0,0,@UpdateMsg,0);
PRINT @UpdateMsg;
RETURN;
END

-- Processing each rule
DECLARE cur CURSOR FOR
SELECT RuleId FROM [BRMS].[dbo].[BusinessRules] WHERE (RuleGroup = @RuleGroup and Active = 1) AND GetDate() BETWEEN RuleStartDate AND RuleEndDate ORDER BY RuleOrderBy ASC;
OPEN cur
FETCH NEXT FROM cur INTO @vRuleId
WHILE @@FETCH_STATUS = 0 BEGIN
EXEC  [dbo].[uspExectueRule]  @RuleId = @vRuleId, @OutputMsg = @UpdateMsg OUTPUT;
FETCH NEXT FROM cur INTO @vRuleId
END
CLOSE cur
DEALLOCATE cur

-- Report Rule Group Runtime
SET @UpdateMsg = 'Rule Group Id: '+@RuleGroup+' ran successfully';
INSERT INTO [dbo].[BusinessRuleLog] ([RuleStarted] ,[RuleEnded],[RuleId],[RowsAffected],[Message],[Failed])
VALUES (@DTStart,GetDate(),@RuleGroup,@CNTSQL,@UpdateMsg,0);
END