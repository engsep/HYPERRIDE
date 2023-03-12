#!/bin/bash
#
#  Utility to dump the idm db and replace it to the backup in mysql-data folder

docker exec db-mysql /usr/bin/mysqldump --databases -u root --password=secret idm > backup.sql