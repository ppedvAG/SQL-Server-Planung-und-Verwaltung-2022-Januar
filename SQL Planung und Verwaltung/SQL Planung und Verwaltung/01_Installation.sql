/*

schulung\Administrator
ppedv2019!


Installation


Instanzfunktionen (Dinge, die man mehrfach installieren kann)
Instanzen sind extrem isoliert... eig Prozess, eig RAM, eig CPU ...
Idee f�r mehr Instanzen:  aus Sicherheitsgr�nden (Sysadmin)


Freigegebene Funktionen
nur einmal pro Rechner


Dienstkonten



!!
jeder Zugriff nach draussen wird immer mit dem Dienstkonto erledigt
..alles was nicht TSQL ist oder auf einen anderen Server stattfindet

alles was per Zeitplan l�uft = Agent


SQL Server DB Engine     NT Service\mssqlserver

	unbeaufsichtigte Dienstkonten.. autom Kennwort�nderungen, nur lokaler Zugriff
	--f�r Netzwerkzugriff : Computerkonto

Volumewartungstask
SQL Dienst darf DB Dateien automatisch selbst vergr��ern ohne ausnullen zu m�ssen.
-----------------------
11111111111111111
-----------------------



SQL Agent  (jobs, Zeitplan)  

SQL Browser teilt dem Client den korrekten Port f�r Instanzen mit

SQLPC5\INSTANZ2 --> Browser(1434 UDP)--> Client--Port 42316
SQLPC5   --- 1433 ..den kennt der Client..  Standport


Volltextsuche  

---> man kann auch DomUser Konten verwenden.. es gibt keine Anforderungen
---allerdings wird f�r den kolaken ZUgriff immer das NT Service Konto verwendet!!


Pfade f�r DBs

Daten und Logdateien--> Idee .. sollte immer getrennte Laufwerke haben

Goldene Regel: trenne Daten von Log -->immer!

BackupPfad: Standardpfad


Sicherheit:

NT Auth oder gemischte Auth (NT + SQL Logins)

bei gemischter Auth, dann ist der SA aktiv (Sysadmin)
komplexes Kennwort f�r SA: -- sp�ter deaktivieren undn Ersatz SA KOnto anlegen SAADMIN zb


--Windows Admins sind keine SQL Admins. --> man muss ein Windows Konto oder Grupe angeben



Tempdb
extrem wichtig f�r Performance..kann sehr gro� werden
sollte eig HDDs haben
Regel: trenne Log von Daten per HDD
Anzahl der Dateien = Anzahl der Kerne, aber max 8


MAXDOP
max Anzahl der Kerne pro Abfrage, = Anzahl der Kerne max 8
fr�her : 0 = alle
eine Abfrage vwewendet entwerder 1 log Prozessor oder den MAXDOP Wert

Arbeitspeicher

max Wert f�r RAM = (Gesamt - OS)  OS ca /mind 2 GB



--Bei bestehdendene Server sollte dies auch kontrolliert werden
*/