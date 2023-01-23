# BRMS Database
This BRMS (Business Rule Management System) is based on running exclusively on Microsoft SQL Server and does not require any special application services. The benefit of running it natively on the database engine is that it allows for efficient execution of business rules without the need for additional infrastructure or resources.

## Running Business Rules
Business rules can be executed by calling the store procedure [dbo].[uspExectueRuleGroup] with the parameter @RuleGroup. This will run the specified Rule Group and all the active, non-expired rules within that group in sequence. The rules and rule groups are stored in the tables BusinessRules and BusinessRulesGroup respectively.

## Rule Logging
All rules that are run are logged in the table BusinessRuleLog. This allows for easy tracking of rule execution and can be used for debugging or auditing purposes.

## Open Source Windows Form Application
An open source Windows Form Application written in C# is provided to aid in the creation of business rules, verification of the rule syntax within BRMS, and setup of rule sequencing. This application makes it easy to create, test and deploy your business rules in the BRMS database.

## Conclusion
By running business rules natively on the database engine, this BRMS provides a simple and efficient solution for managing and executing business rules within an organization. The provided open source Windows Form Application makes it easy to create and manage rules within the BRMS, making it a versatile tool for any organization. rules within the BRMS, making it a versatile tool for any organization.