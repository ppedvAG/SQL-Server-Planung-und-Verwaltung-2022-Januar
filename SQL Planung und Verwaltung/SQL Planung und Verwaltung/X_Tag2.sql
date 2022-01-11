/*

Installation

Dienstkonten
NT Service\....  unbeaufsichtigte Dienstkonten
					- lokales Konto --> kein Netzwerkzugriff
						---> \\Freigabe Zugriff mit Computerkonto
					+ autom Kennwortänderungen
					
					! jeder lokale Zugriff ausserhalb des SQL Servers wird 
						vom Dienstkonto erledigt

				Verwendet man eine DOM User dann sind vorba keine 
					besonderen Rechte notwendig

Pfade
			! Regel: Daten und Logfile sollten immer auf getrenten HDDs sein


MAXDOP 
				! gibt an wieviele log Prozessoren für eine Abfrage zur Verfügung stehen... 
				Regel = Alle Prozessoren , aber max 8


tempdb
		! eig HDDs , trenne Log von Daten
		! Gib der Temdb soviele Dateien wie log prozessoren , max 8
		! seit SQL 2016 kein T 1117 und T 1118 notwendig (automatisch)


Arbeitsspeicher
Max RAM: Limit für SQL Server, damit andere nicht leiden zB OS


Instanzfeatures: 
	SQL Server Enigine + Volltextsuche + Replikation
Freig Features
	Clientkonnektivität


Std Instanz oder benannte Instanz?
STD				Port 1433		Aufruf: Rechnername
ben Instanz: Port ?????	Aufruf: Rechnername\InstName (HR)

--> NT Service\MSSQL$HR


Sicherheit
	Windows Auth
	gemischte Auth (Windows + SQL Login)
		-->SA --> komplexes vergeben

	Angabe des Windows "SQL" Admins


Sortierung



--auf dem HV-SQL2

Instname: HR fix

Instanzfeatures: 
	SQL Server Engine + Volltextsuche + Replikation
Freig Features
	Clientkonnektivität

Dienstkonten: 
			schulung\sqlAgent   ppedv2019!
			schulung\svcSQL      ppedv2019!

Gemischte Auth
	SA--> ppedv2019!
	du selber bist admin

Pfade:
	C:\_SQLDBHR
	C:\SQLBACKUPHR

Arbeitspeicher: empfohlener Wert verwenden


Verschieben der TEMPDB
USE master;  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = tempdev, FILENAME = 'E:\SQLData\tempdb.mdf');  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = templog, FILENAME = 'F:\SQLLog\templog.ldf');  
GO  




	
















*/




