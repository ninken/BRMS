﻿ALTER TABLE [dbo].[BusinessRuleLog] ADD  CONSTRAINT [DF_BusinessRuleLog_CreatedOn]  DEFAULT (getdate()) FOR [RuleStarted]