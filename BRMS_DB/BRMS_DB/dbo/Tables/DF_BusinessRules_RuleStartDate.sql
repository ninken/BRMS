﻿ALTER TABLE [dbo].[BusinessRules] ADD  CONSTRAINT [DF_BusinessRules_RuleStartDate]  DEFAULT (CONVERT([date],getdate())) FOR [RuleStartDate]