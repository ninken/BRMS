ALTER TABLE [dbo].[BusinessRuleLog]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessRuleLog_BusinessRules] FOREIGN KEY([RuleId])
REFERENCES [dbo].[BusinessRules] ([RuleId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[BusinessRuleLog] NOCHECK CONSTRAINT [FK_BusinessRuleLog_BusinessRules]