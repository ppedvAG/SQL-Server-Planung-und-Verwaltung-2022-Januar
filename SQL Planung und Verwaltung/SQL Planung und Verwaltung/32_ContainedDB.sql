/*
http://blog.fumus.de/sql-server/contained-databasedie-eigenstndige-datenbank


Wenn man einen DB auf einen anderen Server restored 
nimmt man nur Infos aus der DB mit...
nichts aber aus SystemDBs..!

master: Login
msdb: Aufträge, Zeitpläne, Email, Warnungen , Operatoren, Wartungspläne

eine COntDB kann das Problem teilweise beheben:

1: Auf Server Contained DB aktivieren
2.  die DB muss bei Eigenständigkeit (optionen: Eigenständigkeit) auf Teilweise gesetzt werden

Was bekommt man:
Login auf die DB

USE [ContDB]
GO
CREATE USER [Sepp] WITH PASSWORD=N'ppedv2019!'
GO


Login nur mit Angabe der DB..!


--#temp Tabellen haben die gleiche Sprachsortierungwie die OrigDB



Aufträge: nope!

aber alles andere geht auch noch... ausser zB Replikation, Cross DB Abfragen


*/