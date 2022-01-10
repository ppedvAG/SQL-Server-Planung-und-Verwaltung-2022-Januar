/* SystemDbs

master
zentrale DB
Logins
Datenbanken
evtl Konfigurationen

Backup: ja definitiv


model
wenn neue DB, dann Koie der model
Vorlagen für neue DBs..

Backup: ja, aber evtl per Script besser
bei Änderungen

USE [master]
GO
ALTER DATABASE [model] 
SET RECOVERY SIMPLE WITH NO_WAIT
GO



msdb
DB für den Agent
Aufträge, Zeitpläne
Wartungspläne
Emailsystem

Backup: ja, defintiv

tempdb
#tabellen, Auslagerungen, IX Wartung, Zeilenversionierung

Backup: No


*/