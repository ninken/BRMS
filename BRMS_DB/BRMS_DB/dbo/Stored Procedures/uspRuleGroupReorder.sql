CREATE PROC [dbo].[uspRuleGroupReorder] (@newOrder INT, @Groupid INT) AS
SET NOCOUNT ON

DECLARE @oldOrder INT
SELECT @oldOrder = GroupOrderBy
FROM BusinessRulesGroup
WHERE [RuleGroup] = @Groupid 

UPDATE BusinessRulesGroup
SET GroupOrderBy = @newOrder
WHERE [RuleGroup] = @Groupid AND GroupOrderBy <> 999999

IF @newOrder < @oldOrder -- moving up
BEGIN
UPDATE BusinessRulesGroup
SET GroupOrderBy = GroupOrderBy + 1
WHERE ([RuleGroup] <> @Groupid) AND GroupOrderBy BETWEEN @newOrder AND @oldOrder
AND GroupOrderBy <> 999999
END

ELSE IF @newOrder <> 1 -- moving down
BEGIN
UPDATE BusinessRulesGroup
SET GroupOrderBy = GroupOrderBy - 1
WHERE ([RuleGroup] <> @Groupid ) AND GroupOrderBy BETWEEN @oldOrder AND @newOrder 
AND GroupOrderBy <> 999999;
END
exec dbo.uspRuleGroupOrderFix;