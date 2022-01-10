/*
DB Objekte



Tabellen
Primärschlüssel-->Fremdschlüssel
Normalisierung 
Beziehungen
Datentypen
Diagramm


Sichten / Views
-- gemerkte Abfragen, wird wie eine Tabelle behandelt
-- INS UP DEL eig Rechte 
--keine Daten

create view VName
as
select ...

select * from Vname



Prozeduren = Batch
--oft BI Logik enthalten

exec gpName


create proc gpname @par1
as
INS
UP
DEL
SEL




Functions

select f(spalte), f(Wert ) from f(Wert) where f(spakte) = f(wert)


Perfomance
normalerweise:
langsam---> schnell
d       a/b      c

--kann sein
c               d                a/b


a) adhoc Abfragen
b) Abfragen per Sicht
c) exec proc
d) Fn







*/