﻿ALTER TABLE [dbo].[BusinessRuleLog] ADD  CONSTRAINT [DF_BusinessRuleLog_rowguid]  DEFAULT (newid()) FOR [rowguid]