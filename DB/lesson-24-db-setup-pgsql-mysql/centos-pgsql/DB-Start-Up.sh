#!/bin/bash
/usr/pgsql-15/bin/initdb
/usr/pgsql-15/bin/pg_ctl -D /var/lib/pgsql/15/data -l /tmp/pg_logfile start
createdb -U postgres test-db-name
