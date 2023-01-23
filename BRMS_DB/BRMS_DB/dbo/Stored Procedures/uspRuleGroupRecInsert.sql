CREATE PROCEDURE [dbo].[uspRuleGroupRecInsert] 
(
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
 INSERT INTO [dbo].[BusinessRulesGroup]
 ([RuleGroupName], [DBTable], [TableName], [TableKey], [DBView], [ViewName], [ViewKey], [GroupActive], [GroupOrderBy])
  VALUES
  (
  @RuleGroupName, @DBTable ,@TableName ,@TableKey ,@DBView ,@ViewName,@ViewKey,@GroupActive,
  CASE WHEN @GroupActive = 1 THEN (SELECT TOP 1 ISNULL(MAX(GroupOrderBy),0)+1 GroupOrderBy FROM BusinessRulesGroup WHERE GroupOrderBy <> 999999) 
  ELSE 999999 END
  );
  EXEC dbo.uspRuleGroupOrderFix;
END