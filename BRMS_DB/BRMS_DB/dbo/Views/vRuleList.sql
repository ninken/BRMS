CREATE View [dbo].[vRuleList] AS
Select Top 10000000
A.RuleGroup as GrpId, A.RuleGroupName as GroupName,A.GroupOrderBy, RuleId,B.RuleTitle, B.RuleOrderBy,B.RuleStartDate, B.RuleEndDate, B.Active, A.GroupActive
FROM            BusinessRulesGroup as A
INNER JOIN BusinessRules as B
on A.RuleGroup = B.RuleGroup
Order by A.GroupOrderBy,B.RuleOrderBy ASC