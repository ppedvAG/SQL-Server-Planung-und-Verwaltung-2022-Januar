--hans konnte vorher nicht lesen
--und nach Deny Recht ;-) erst recht nicht
select * from dbo.employees

--du admin... muss ne Sicht anlegen

create view it.projekte
as
select * from it.kst

use [Northwind]
GO
GRANT CREATE VIEW TO [Hans]
GO
use [Northwind]
GO
GRANT ALTER ON SCHEMA::[IT] TO [ITRolle]
GO



create view it.projekte
as
select * from it.kst --geht 


ALTER view it.projekte
as
select * from dbo.employees-- geht nicht

select * from it.projekte --geht!


--dbo als Besitzer
--wenn jedes Objekt densleben Besitzer hat, dann muss man nur das aufgrufene Objekt auf Rechte kontrollieren

---> tu niemals einem normal Sterblichen das Recht ALTER für Sichten/Proz/F() geben