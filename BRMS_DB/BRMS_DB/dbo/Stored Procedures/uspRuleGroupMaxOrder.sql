CREATE PROC [dbo].[uspRuleGroupMaxOrder] AS
BEGIN
SET NOCOUNT ON

SELECT ISNULL(MAX(GroupOrderBy),0) AS LastOrderBy
FROM BusinessRulesGroup
WHERE GroupOrderBy <> 999999
END