USE [master]
GO
CREATE LOGIN [Susi] WITH PASSWORD=N'123', 
DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Susi] FOR LOGIN [Susi]
GO


select * from  syslogins

use northwind

select * from sysusers


Susi ist MA Tante
Hans ist IT Fuzzi



USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO


CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO


create table it.kst(itkst int)
create table it.personal(itperso int)



create table ma.kst(makst int)
create table ma.personal(maperso int)

--direktes Recht auf Tabelle ..auch auf Sichten/Proz/F()
use [Northwind]
GO
GRANT SELECT ON [IT].[personal] TO [Susi]
GO


select * from customers
select * from kst --Hääää??

--JEder hat ein Standardschema
--jeder macht das


select * from dbo.....

USE [Northwind]
GO
ALTER USER [Hans] WITH DEFAULT_SCHEMA=[IT]
GO


--Man sieht keine Vererbeten Rechte , ausser man fügt den User zu den Berechtigungen dazu und prüft über Eplizite Rechte

USE [Northwind]
GO
CREATE ROLE [ITRolle] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Hans]
GO

use [Northwind]
GO
REVOKE SELECT ON SCHEMA::[IT] TO [Hans] AS [dbo]
GO
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [ITRolle]
GO


--Fallbeispiel:
-- Peter ist neuer It Mitarbeiter
--soll das gleiche tun sollen dürfen, was Hans kann

USE [master]
GO
CREATE LOGIN [Peter] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]

CREATE USER [Peter] FOR LOGIN [Peter]
GO

ALTER USER [Peter] WITH DEFAULT_SCHEMA=[IT]

ALTER ROLE [ITRolle] ADD MEMBER [Peter]
GO


--Susi muss Tabellen anlegen dürfen...

use [Northwind]
GO
GRANT CREATE TABLE TO [Susi]
GO

use [Northwind]
GO
GRANT ALTER ON SCHEMA::[MA] TO [Susi]-- inkl DROP und CREATE
GO











