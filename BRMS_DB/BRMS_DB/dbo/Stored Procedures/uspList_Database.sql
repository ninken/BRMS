CREATE PROC [dbo].[uspList_Database]
AS
BEGIN
SELECT '['+[name]+']' AS [Database] FROM Sys.sysdatabases
-- Add any additional database you would like to hide.
WHERE [name] NOT IN ('master','tempdb','model','msdb','ReportServer','RedGateMonitor','ApexSQLBIMonitor','ApexSQLCrd', 'BRMS')
AND [name] NOT LIKE 'ArchiveCrd_%'
END