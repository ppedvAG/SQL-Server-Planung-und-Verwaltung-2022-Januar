/* SystemDbs

master
zentrale DB
Logins
Datenbanken
evtl Konfigurationen

Backup: ja definitiv


model
wenn neue DB, dann Koie der model
Vorlagen f�r neue DBs..

Backup: ja, aber evtl per Script besser
bei �nderungen

USE [master]
GO
ALTER DATABASE [model] 
SET RECOVERY SIMPLE WITH NO_WAIT
GO



msdb
DB f�r den Agent
Auftr�ge, Zeitpl�ne
Wartungspl�ne
Emailsystem

Backup: ja, defintiv

tempdb
#tabellen, Auslagerungen, IX Wartung, Zeilenversionierung

Backup: No


*/