MYSQL_USER?=root
MYSQL_PASS?=password
MYSQL_HOST?=127.0.0.1
MYSQL_PORT?=3306
MYSQL_NAME?=database

DUMP_FILE?=dump

SPACES_FOLDER?=namespace/folder
SPACES_FILE?=uploaded-dump

SPACES_CONF?=./spaces.conf

all: download compress upload clean

clean:
	-rm $(DUMP_FILE).sql
	-rm $(DUMP_FILE).sql.tar.gz

download:
	mysqldump -u $(MYSQL_USER) -p$(MYSQL_PASS) \
		-h $(MYSQL_HOST) -P $(MYSQL_PORT) \
		--databases $(MYSQL_NAME) \
		--routines \
		--single-transaction --quick --lock-tables=false \
		> $(DUMP_FILE).sql

compress:
	tar -czvf $(DUMP_FILE).sql.tar.gz $(DUMP_FILE).sql
	
upload:
	s3cmd put $(DUMP_FILE).sql.tar.gz \
		s3://$(SPACES_FOLDER)/`date +%Y%m%d-%H%M%S`-$(SPACES_FILE).sql.tar.gz \
		-c $(SPACES_CONF)
