CREATE PROCEDURE [dbo].[uspRuleOrderFix] AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ReOrder INT; 
    DECLARE @RuleId INT; 
    DECLARE @RuleGrpId INT; 
	DECLARE @MaxRuleInGrp INT;
    DECLARE @MyCursor CURSOR;
    DECLARE @Link VARCHAR(18); 
    DECLARE @UpdateCursor CURSOR;

    UPDATE dbo.BusinessRules SET RuleOrderBy = 999998 WHERE [Active] = 1 AND [RuleOrderBy] = 999999;

    SET @MyCursor = CURSOR FOR 
    SELECT DISTINCT RuleGroup FROM BusinessRules WHERE RuleOrderBy <> 999999

    OPEN @MyCursor
    FETCH NEXT FROM @MyCursor INTO @RuleGrpId

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @UpdateCursor = CURSOR FOR 
        SELECT TOP (999999) RuleId FROM BusinessRules WHERE RuleOrderBy <> 999999 AND RuleGroup = @RuleGrpId ORDER BY RuleOrderBy ASC

		SELECT @MaxRuleInGrp = Max(RuleOrderBy) FROM BusinessRules WHERE RuleOrderBy <> 999999 AND RuleGroup = @RuleGrpId
		PRINT Convert(varchar(18),@MaxRuleInGrp)

        OPEN @UpdateCursor
        FETCH NEXT FROM @UpdateCursor INTO @RuleId
        SET @ReOrder = 0

        WHILE @@FETCH_STATUS = 0
        BEGIN
		        IF @ReOrder < @MaxRuleInGrp
			BEGIN
				UPDATE BusinessRules
				SET  @ReOrder= RuleOrderBy  = @ReOrder + 1
				WHERE RuleId = @RuleId
				FETCH NEXT FROM @UpdateCursor INTO @RuleId
			END
        END

        CLOSE @UpdateCursor
        DEALLOCATE @UpdateCursor

        FETCH NEXT FROM @MyCursor INTO @RuleGrpId
    END

    CLOSE @MyCursor
    DEALLOCATE @MyCursor
END