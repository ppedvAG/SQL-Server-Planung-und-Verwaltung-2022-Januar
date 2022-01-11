--BACKUP

/*

Backupvarianten


Vollsicherung  V
Differentielle   D
T-protkoll        T



V
komplette Sicherung zu einem Zeitpunkt
Dateien und Pfade werden mitgesichert
aber es wird keie Luft mitgesichert..also Sicherung mit Sicherheit kleiner
Checkpoint  veränderte Seiten im RAM in die Datenddatei wegschreiben

D
merkt sich veränderte Blöcke und sichert nur veränderte Blöcke seit Vollsicherung
Zeitpunkt


T
merkt sich den Weg (I U D) bzw Verlauf mit Zeit
daher: Restore auf Sekunde möglich

--> Wiederherstellungsmodel!!!! 
regelt, wie detailiert  im Tlog mitspeichert wird
Einstellung pro DB

Einfach
I U D -- und wird diese Einträge später wieder löschen
--> keine Sicherung und Restore per TLog
-->kein Restore auf Sek möglich
:: TestDBs, kaum Traffic, Datenverlust darf Stundenniveau


!!! NUR DIE SICHERUNG DES LOGFILES LEERT DAS LOGFILE

Massenprotokolliert
..wie Einfach, aber es wird nichts gelöscht!
-.-wird aber Masseneinfügeoperation nicht exakt mitprotkollieren
--daher kein Restore auf Sek möglich, wenn ein masseinfügeop  stattfand
--> Das Tlog wächst und wächst und wächst
==> Sicherung des Logfiles dringend notwendig


Vollständig
..sehr exakte Protkollierung..
auf sek restore
--Logfile wächst stärker
==> Sicherung des Logfiles dringend notwendig



---SICHER+ LANGSAMER
Model Vollständig


MASSENPROTKOLLIERT

EINFACH 
--SCHNELL und UNSICHERER



WAS KANN ALLES PASSIEREN?

1) versehentliches Löschen ändern etc
	DB ok, aber falsche Daten-- restore unter anderen DB Namen

1.1) Spezialfall... restore mit geringst möglichen Datenverlust
		DB ohne Datenverlust ersetzen


2) komplette DB Defekt (korrupt)
		--Restore aus Backup mit ersetzen


3) Teile der DB korrupt zb (Logfile, Datendatei)
--Anfügen der mit oder ohne Logfile


4) Server ist ein Haufen Asche, aber die HDDS existieren noch
  oder auch nur einen Teil der Dateien noch übrig

5) Wenn ich weiss, dass gleich was passieren kann..



----
V
	T
	T
	T
		D
	T
	T
	T
		D
	T
	T
	T

	Restore fpr letzten Zustand
	V  und letzte D  und alle folgenden TTT
	V und alle folgenden Ts


	V D TTT
	V TTTTTTTTTT

	Aber!!
	Welcher Restore ist der kürzeste?
	nur das V .. 
	je häufiger das V desto kürzer der Restore


	Wie lange dauert der Restore des vorletzten T?
	dauert solange wie TX dauert beim Ausführen im TLog
	--> wir wollen nicht viele Ts restoren..

	*/

	--VOLL
	BACKUP DATABASE [BackupDemo] 
	TO  DISK = N'D:\_BACKUP\BackupDemo.bak'
	WITH  RETAINDAYS = 14, NOFORMAT, NOINIT,  NAME = N'BackupDemo-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--DIFF
BACKUP DATABASE [BackupDemo] 
TO  DISK = N'D:\_BACKUP\BackupDemo.bak' 
WITH  DIFFERENTIAL , 
RETAINDAYS = 14, NOFORMAT, NOINIT,  NAME = N'BackupDemo-Full Database Backup',
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--TLOG
BACKUP LOG [BackupDemo] 
TO  DISK = N'D:\_BACKUP\BackupDemo.bak' 
WITH  RETAINDAYS = 14, NOFORMAT, NOINIT,  NAME = N'BackupDemo-Full Database Backup',
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--V TTT D TTT D TTT


use BackupDemo

select * into t1 from sysmessages

select * from t1

alter table t1 add id int identity

10:38

update t1 set error = error +1 


--nun 10:48
--1) logischer Fehler 
--spielt man ds Backup von vor 30min ein, verliert baner auch 30 min andere Daten

--Idee: DB unter anderen Namen restoren: BackupDemo1047 und dann die nicht fehlerhaften DAten aus der DB2 in DB1 korrigieren


USE [master]
RESTORE DATABASE [BackupDemo1036] 
FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 1,  MOVE N'BackupDemo' TO N'D:\_SQLDB\BackupDemox1036.mdf',  MOVE N'BackupDemo_log' TO N'D:\_SQLDB\BackupDemox1036_log.ldf',  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE DATABASE [BackupDemo1036] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo1036] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo1036] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo1036] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 12,  NOUNLOAD,  STATS = 5

--Code in etwa
update t1 set error = e1.error
from backdemo1036..t1  e1 inner ...

--das geht nur , wenn man sehr ganu weiss was verschludert wurde.


--Fall2 komplette DB defekt und gilt als "fehlerverdächtig"
--Datei ersetzen und alle Connections schliessen
USE [master]
--alle Leute runter von der DB  ausser mir selbst
ALTER DATABASE [BackupDemo] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--Replace: Dateien ersetzen!!
RESTORE DATABASE [BackupDemo] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [BackupDemo] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [BackupDemo] FROM  DISK = N'D:\_BACKUP\BackupDemo.bak' WITH  FILE = 12,  NOUNLOAD,  STATS = 5
ALTER DATABASE [BackupDemo] SET MULTI_USER

GO


--Was ist , wenn man die BAK Datei bveim Restore nicht sieht
--a) richtiger Server
--b) Endung der Datei oder evtl sogar fehlende Endung
--c) Rechte auf Verzeichnis für Dienst.. ?
	  --> welcher Dienst?


	  --auf Pfade aufpassen



	--FALL 1.1 Restore zum letztemöglichen Zeitpunkt
	--DB erstzen und mit geringstmöglichen Datenverlust


	--800 V
	--900 D
	--930 T
	--1000 T
	--1030 T
	--1047 BOING!!
	--akt Uhrzeit 10:51
	--nachste Sicherung 1100

	--DB läuft noch....logischer Fehler

	/*
	Warten bis 11 Uhr dann sicherung (dauer: 5 min)
	dann restore bis 1030 --Datenverlust 5 min weil Sicherung von 11 Uhr Online läuft

	Manko: 5 min ..ok ..aber die Dauer  14 Wartezeit
	--Daten sind von 10:30

	--Ausfallzeit dürfte evtl nur 15 min betrage

	--besser so:
	Backup log um 1051 (1030 bis 1050 enthalten) ..5 min
	Restore von 1046 

	Datenverlust: 5 min alles was ab backup log läuft...


	--noch besser:
	alle Leuter von der DB kicken!.. keine I U D mehr möglich
	backup log um 10:51
	restore von 1046
	alles was nach 1046 passierte steckt nun zumindest im Backup










	*/




--





/*
Fall 4 : DB auf anderen Serer per Datei restoren
Fall 4b: wenn eine Datei defekt oder fehlt


*/
select * from sysdatabases
--wenn alle DAteien noch da sind
USE [master]
GO
CREATE DATABASE [BackupDemo1036] ON 
( FILENAME = N'D:\_HRDB\BackupDemox1036.mdf' ),
( FILENAME = N'D:\_HRDB\BackupDemox1036_log.ldf' )
 FOR ATTACH
GO

--wenn ldf fehlt, dann neues LDF
USE [master]
GO
CREATE DATABASE [BackupDemo1036] ON 
( FILENAME = N'D:\_HRDB\BackupDemox1036.mdf' )
 FOR ATTACH
GO


--wenn mdf fehlt.. dann Arschkarte








--FALL 5: wenn wir wissen dass gleich was passiert


--SNAPSHOT

CREATE DATABASE DBNAMEDESSNAPSHOT 
ON
( NAME = LogNamederOriginalDb, 
FILENAME ='D:\_SQLDB\DBNAMEDESSNAPSHOT.mdf' )
AS 
SNAPSHOT OF OriginalDB;
GO


CREATE DATABASE BackupDemo1215
ON
( 
NAME = BackupDemo, 
FILENAME ='D:\_SQLDB\BackupDemo1215.mdf' 
)
AS 
SNAPSHOT OF BackupDemo;
GO



--Kann man vom Snapshot ein Backup machen?
--NEIN!

--Kann man ein SNAPSHOT restoren?
--NEIN!

--Kann man die OrigDB backupen?
--Ja!

--Kann man die origDB restore im Falle eines vorhanden Snapshots?
--NEIN!
--Wenn normaler Restore , dann müssen alle Snapshots weg?

--Kann man mehrere Snapshot eines DB haben?
--JA! aber evtl Vorsicht


--Cool.. Restore von Snapshot

--Aufpassen: es darf keiner auf SnapshotDB oder auch OrigDB sein?

select * from sysdatabases--dbid rausfinden

select db_id('BackupDemo') --10
select db_id('BackupDemo1215') --12

select * from sysprocesses where dbid in (10,12)
Kill 90
KILL 63

restore database backupdemo 
from database_Snapshot = 'BackupDemo1215'











