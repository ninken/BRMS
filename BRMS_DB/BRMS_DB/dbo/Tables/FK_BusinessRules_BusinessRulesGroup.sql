ALTER TABLE [dbo].[BusinessRules]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessRules_BusinessRulesGroup] FOREIGN KEY([RuleGroup])
REFERENCES [dbo].[BusinessRulesGroup] ([RuleGroup])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[BusinessRules] NOCHECK CONSTRAINT [FK_BusinessRules_BusinessRulesGroup]