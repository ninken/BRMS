CREATE VIEW [dbo].[vRuleLogHistory] AS

SELECT TOP 10000000 
    A.LogId, C.RuleGroupName, A.RuleId, B.RuleTitle, A.Message, A.RuleStarted, A.RuleEnded,A.RowsAffected, A.Failed
	FROM	BusinessRuleLog AS A
	INNER JOIN BusinessRules AS B
	ON A.RuleId = B.RuleId
	INNER JOIN dbo.BusinessRulesGroup AS C
	ON B.RuleGroup	= C.RuleGroup
WHERE A.RuleStarted > GETDATE()-30
ORDER BY A.RuleStarted DESC