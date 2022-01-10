/*

DB Settings


wie groß ist einen DB per default?
16 MB --> Daten 8 MB .mdf   Log 8 MB .ldf

Um wieviel wächst eine DB per default?
64MB für Log und Daten (früher 1MB Daten und 10% Logfile)

Vermeide HDD Zugriffe


Idee. mach die DB so groß, wie sie später sein soll!
Später?? --> in 3 Jahre


Trenne Daten von Logfiles..
im PRINZIP bei jeder DB neu überlegen.. weitere HDDs verwenden..

Kompabilitätsgrad bei update anpassen..


*/

create database testdb

--kann man das feststellen wie größ etc...--Berichte !!

--Evtl QueryStore aktivieren

