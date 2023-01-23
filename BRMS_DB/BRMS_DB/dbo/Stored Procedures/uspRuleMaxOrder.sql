CREATE PROC [dbo].[uspRuleMaxOrder]
@Groupid INT
AS
BEGIN
SET NOCOUNT ON

SELECT ISNULL(MAX(RuleOrderBy),0) AS LastOrderBy
FROM BusinessRules
WHERE [Active] = 1 AND [RuleGroup] = @Groupid AND [RuleOrderBy] <> 999999
END