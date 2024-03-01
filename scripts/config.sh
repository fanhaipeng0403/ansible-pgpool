#!/bin/bash
mkdir -p /var/log/pgpool
chown postgres:adm /var/log/pgpool
chmod 775 /var/log/pgpool
touch /var/log/pgpool/pgpool.log
chown syslog:adm /var/log/pgpool/pgpool.log
mkdir -p /var/log/postgresql
chown root:postgres /var/log/postgresql
chmod 775 /var/log/postgresql
touch /var/log/postgresql/postgresql.log
chown postgres:adm /var/log/postgresql/postgresql.log