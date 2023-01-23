CREATE PROCEDURE [dbo].[uspRuleLogHistory](@RuleStarted AS varchar(10),@RuleEnded AS varchar(10), @RuleGroupName as nvarchar(60)) AS  
BEGIN  
DECLARE @sql NVARCHAR(1000)
DECLARE @fsql NVARCHAR(300)
SET @fsql = ''

	IF (@RuleGroupName <> 'All Groups' AND @RuleGroupName <> '')
	BEGIN
	SET @fsql = ' AND RuleGroupName ='''+ @RuleGroupName+''''
	END 

SET @sql = 'SELECT A.LogId, C.RuleGroupName, A.RuleId, B.RuleTitle, A.Message, A.RuleStarted, A.RuleEnded,A.RowsAffected, A.Failed '+ 
' FROM	BusinessRuleLog AS A INNER JOIN BusinessRules AS B ON A.RuleId = B.RuleId '+
' INNER JOIN dbo.BusinessRulesGroup AS C ON B.RuleGroup	= C.RuleGroup'+
' WHERE (A.RuleStarted >= '''+@RuleStarted+''''+ ' AND '''+@RuleEnded+' 23:59:59.9'''+' >= A.RuleEnded ) '+ @fsql +' ORDER BY A.RuleStarted DESC'
PRINT(@sql)
EXECUTE(@sql)
END