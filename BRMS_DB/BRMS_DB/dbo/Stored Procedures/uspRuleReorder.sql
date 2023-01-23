CREATE PROC [dbo].[uspRuleReorder]
@Ruleid INT,
@newOrder INT,
@Groupid INT
AS

SET NOCOUNT ON

DECLARE @oldOrder INT
SELECT @oldOrder = RuleOrderBy
FROM BusinessRules
WHERE [RuleGroup] = @Groupid AND RuleId = @Ruleid AND RuleOrderBy <> 999999

UPDATE BusinessRules
SET RuleOrderBy = @newOrder
WHERE [RuleGroup] = @Groupid AND RuleId = @Ruleid  AND RuleOrderBy <> 999999

IF @newOrder < @oldOrder -- moving up
BEGIN
UPDATE BusinessRules
SET RuleOrderBy = RuleOrderBy + 1
WHERE ([RuleGroup] = @Groupid) AND RuleOrderBy BETWEEN @newOrder AND @oldOrder
AND RuleId <> @Ruleid  AND RuleOrderBy <> 999999
END

ELSE IF @newOrder <> 1 -- moving down
BEGIN
UPDATE BusinessRules
SET RuleOrderBy = RuleOrderBy - 1
WHERE ([RuleGroup] = @Groupid) AND RuleOrderBy BETWEEN @oldOrder AND @newOrder
AND RuleId <> @Ruleid  AND RuleOrderBy <> 999999
END

EXEC dbo.uspRuleOrderFix;