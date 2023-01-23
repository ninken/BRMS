CREATE PROCEDURE [dbo].[uspRuleGroupOrderFix]
AS
SET NOCOUNT ON
DECLARE @ReOrder int 
DECLARE @id int 
DECLARE @MyCursor CURSOR
DECLARE @Link varchar(18) 
DECLARE @UpdateCursor CURSOR
Set @MyCursor = CURSOR FOR Select Distinct RuleGroup  From BusinessRulesGroup Where GroupOrderBy <> 999999

OPEN @MyCursor
FETCH NEXT FROM @MyCursor into @Link

WHILE @@FETCH_STATUS = 0
BEGIN
Set @UpdateCursor = CURSOR FOR Select TOP (999999) RuleGroup From BusinessRulesGroup WHERE  GroupOrderBy <> 999999 order by GroupOrderBy  ASC
OPEN @UpdateCursor

FETCH NEXT FROM  @UpdateCursor into @id
Set @ReOrder = 0
WHILE @@FETCH_STATUS = 0
BEGIN
UPDATE BusinessRulesGroup
SET  @ReOrder= GroupOrderBy  = @ReOrder + 1
WHERE RuleGroup = @id
FETCH NEXT 
FROM @UpdateCursor INTO @id
END
CLOSE @UpdateCursor
DEALLOCATE @UpdateCursor

FETCH NEXT 
FROM @MyCursor INTO @Link
END

CLOSE @MyCursor
DEALLOCATE @MyCursor