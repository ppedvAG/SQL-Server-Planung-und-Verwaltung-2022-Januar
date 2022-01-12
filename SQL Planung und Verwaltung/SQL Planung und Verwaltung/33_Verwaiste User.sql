/*



User JamesBond ohne Login


	
Idee1 : 
	Login anlegen
	Name: JamesBond
	StdDB : whoami
	UserMapping: aktivieren

	Mist: JamesBond gibts ja schon!!!


Idee2:
	Login anlegen
	Name: JamesBond
	StdDB : whoami
	UserMapping: nicht  aktivieren  ;-)


	Mist: geht auch nicht.. warum: Weil die SID des USer JamesBond nicht diesselbe sein wird, wie die von JamesBond Login


Idee3: 
		Rechtevergabe: Rollen und Schemas
		Jedes Recht in der DB mwurde nur per Rolle vergeben

		JamesBond User löschen aus DB

			Login anlegen
			Name: JamesBond
			StdDB : whoami
			UserMapping: aktivieren
			MItglied in Rolle Personalabteilung
			Korrekte StdSchema evtl..

			Nachteil: neues Kennwort


Idee4:
		warum nicht das Login mitnehmen??

		Wie denn?
		Einkaufskorb: sp_help_revlogin

		https://docs.microsoft.com/de-de/troubleshoot/sql/security/transfer-logins-passwords-between-instances

		*/
		--auf OrigServer
		sp_help_revlogin
		--Ergbebnis des Script in eine .sql Datei kopieren



		--per SQLCMD automatisierbar.. als Batchdatei
		--oder per auftrag in AgentsJob
		sqlcmd -SKAIRO\Hr -q"sp_help_revlogin" -dmaster -oc:\logins.sql


--Idee5: allerdings depricated


--auf die DB gehen, in der die verwaisten User enthalten sind

use whoamiDB

--verwa. User?
sp_change_users_login 'Report'

/*
JamesBond  	0xD1CC690FDC6EEC4B9683D2CCE45B7B73
SemiSA	       0x0DA8BCA3C3CB204F98DB3950564E3D38

*/

--wenn ein Login mit gleichen Namen schon vorhanden ist
--------------------------------------   User    Login
sp_change_users_login 'Update_one', 'Susi', 'Susi'

--wenn noch ein Login da ist..

sp_change_users_login 'Auto_fix','JamesBond', NULL, 'ppedv2019!'
