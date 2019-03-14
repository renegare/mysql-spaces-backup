backup:
	mysqldump -u root -ppassword -h 127.0.0.1 -P 3307 \
		--databases db_dmp \
		--routines \
		> dump.sql

compress:
	tar -czvf dump.sql.tar.gz dump.sql
	
upload:
