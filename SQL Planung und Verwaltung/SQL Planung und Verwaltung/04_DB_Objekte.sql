/*
DB Objekte



Tabellen
Primärschlüssel-->Fremdschlüssel
Normalisierung 
Beziehungen.. sper cool. weil Datenintegrität immer konsistent bleibt
..was versteckt sich hinter einer best ID

Datentypen
KundenID int (ganze Zahlen) -2,1 Mrd +2,1Mrd ..bigint, smallint, tinyint, bit
Vorname char(50) = fixe Länge
	           varchar(50): bis zu 50 Zeichen lang
			   nchar(50), nvarchar(50): doppelte Menge, aber alle Zeichen erlaubt
			   bei flexiblen Längen auch flex Datentyp
GebDatum
			datetime (ms genau)
			smalldatetime (sek)
			date / time
			datetime2 (ns)
			datetimeoffset (ns inkl Zeitzone)

Preis
		money ( 8 Nachkommas)
		decimal(5,2)  5 Stellen , davon 2 Nachkommastellen











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