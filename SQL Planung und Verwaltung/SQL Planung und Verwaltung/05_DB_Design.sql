/*

Normalisierung, Renundanz
Primärschlüssel  braucht man für Beziehungen, Bedingung PK muss eindeutig sein
Fremdschlüssel
1.2.3.4.5 Normalform

nchar statt varchar.. ist doch  nicht schlimm

Alles was auf der HDD liegt kommt 1:1 in RAM  !!



--create table t1 (id int, spx char(4100)---

-- 4byte + 4kb--> ca 4 kb

--20000 DS * 4kb ==> 80MB.. hat aber 160MB ???????

--kann man Verschwensung messen

*/
use testdb
dbcc showcontig('t1')

-- Gescannte Seiten.............................: 20000
--- Mittlere Seitendichte (voll).....................: 50.79%



-- Gescannte Seiten.............................: 2000000
--- Mittlere Seitendichte (voll).....................: 91.79%


*/

delete from customers where customerid = 'ALFKI'
select * from orders where customerid = 'ALFKI'