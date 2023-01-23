CREATE PROCEDURE [dbo].[uspRuleGroupRecUpdate] 
(
  @RuleGroup int,
  @RuleGroupName nvarchar(60),
  @DBTable nvarchar(150),
  @TableName nvarchar(150),
  @TableKey nvarchar(150),
  @DBView nvarchar(150),
  @ViewName nvarchar(150),
  @ViewKey nvarchar(150),
  @GroupActive bit
)
AS
BEGIN

DECLARE 
@ChkActive bit,
@ChkOrderBy int
SELECT @ChkActive = GroupActive,@ChkOrderBy =[GroupOrderBy] FROM [dbo].[BusinessRulesGroup] WHERE RuleGroup = @RuleGroup 
IF (@GroupActive = 0) SET @ChkOrderBy = 999999
IF (@GroupActive = 1 and @ChkActive = 0) SET @ChkOrderBy = (SELECT TOP 1 ISNULL(MAX(GroupOrderBy),0)+1 AS GroupOrderBy FROM BusinessRulesGroup WHERE GroupOrderBy <> 999999) 

 UPDATE [dbo].[BusinessRulesGroup]
 SET 
 [RuleGroupName] = @RuleGroupName, 
 [DBTable] = @DBTable, 
 [TableName] = @TableName, 
 [TableKey] = @TableKey, 
 [DBView] = @DBView, 
 [ViewName] = @ViewName, 
 [ViewKey] = @ViewKey, 
 [GroupActive] = @GroupActive, 
 [GroupOrderBy] = @ChkOrderBy
 WHERE RuleGroup = @RuleGroup;
 
 EXEC dbo.uspRuleGroupOrderFix;

END