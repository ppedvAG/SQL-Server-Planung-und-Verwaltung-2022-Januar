/*
Oberflächen:

WIndows Taskmanager
--Antivirentool.. andere Prozesse--> SQL Server!!

Aktivitätsmonitor


eigtl SQL Abfragen auf DMVs  Data Management Views








*/

--Prozesse im SQL Server ..Benutzer > 50
select * from sysprocesses

--Warteressourcen
select * from sys.dm_os_wait_Stats


--Abfrage-->Queue(Briefkasten)-->Worker-->Ressourcenfrage (HDD LOG..ca 1070)

---|---------------------------------------------------------|-- > RUNNNING
--                                                                                            100ms Wartezeit gesamt

--                                                                               |---------|--->RUNNING
--                                                                                  CPU   
--                                                                                   20ms

--INsofern 100ms -20ms = Wartezeit auf Ressource 

--Ist CPU Zeit > 25% der gesamten Zeit 20/100 , dann CPU Engpass

---Leider sind die Zeiten in der sys.dm... kummulierend
--dh wir können das zeitlich  nicht einteilen
--cool wäre.. regelm messen und notieren


--Tools zum Messen und Historisieren
--Datensammler  
--oder alternativ per Job Abfragen selber schreiben mssen und wegnotieren
--



--Auch Entwickler messen:
select * into test from customers, [order details]

select  * from test where customerid = 'ALFKI'
--SCAN = komplettes a bis z druchsuchen
--IX SCAN  etwas weniger, 
--CL IX SCAN  oder TABLE SCAN = gesamte Tabelle

--SEEK.. ist das herauspicken

set statistics io, time on

--das kann  man aber sehr schön im Abfragespeicher sammeln.. 
--Dieser muss allerdings pro DB aktiviert werden (Eigenschaften der DB)


--Aufzeichnen von Daten aus Windows (Umgebung) und SQL Server
--Perfmon



select * from sys.dm_os_performance_counters




select * from sys.dm_db_index_physical_Stats(db_id('northwind'),object_id('t2'), NULL,NULL, 'detailed')

--forward_record_Count: 51638..sollte immer 0 sein



