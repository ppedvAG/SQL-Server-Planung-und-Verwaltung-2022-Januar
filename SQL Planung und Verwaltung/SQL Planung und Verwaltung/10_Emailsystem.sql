/*

1: SMTP Server
 keinen POP3/IMAP

 --MAILServer: 
	HV-SQL2

	Authentifizierung: anyonym

	Sendeemail: sqlservice@sql.local

	Absendename: SQL HV-SQL2

	Maildomäne: sql.local

	Verwaltung:
		Database Mail...
		Profil (alle SMTP Settings)

Gast Account ZUgriff auf Profil


2: Agent muss wissen, welches Profil er verwenden
 a) Warnungsystem aktivieren und Profil zuweisen
 b) Agent neu starten

 3. Wenn SQL 2014 oder früher, dann evtl rechte in msdb anpassen
 gilt auch für den Agent--> für offtl Profile muss man in der 
 Rolle DatabaseMailuserRole enthalten sein (msdb)





*/

use msdb

exec sp_send


