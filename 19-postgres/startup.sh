#!/usr/bin/env bash

[ ! -e /data/PG_VERSION ] && chown postgres\: /data && su - postgres -c "/usr/lib/postgresql/11/bin/initdb -D /data"
su - postgres -c "cp /postgresql.conf /data && /usr/lib/postgresql/11/bin/pg_ctl -D /data start -l /data/postgres-$(date +%F).log"

tail -f /dev/null