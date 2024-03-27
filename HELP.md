在每个节点依次执行



sudo find / -name pgpool_status
rm -rf /var/log/pgpool
cat /var/log/pgpool/pgpool_status

cd /var/log/pgpool


systemctl stop postgresql-14.service
systemctl restart postgresql-14.service
systemctl restart pgpool-II
journalctl -u pgpool-II --no-pager | tail -n 1000



systemctl status pgpool-II
systemctl status postgresql-14.service

systemctl stop postgresql-14.service
systemctl stop pgpool-II
systemctl disable  postgresql-14.service
systemctl disable  pgpool-II
rm -rf "/var/lib/pgsql/14/data/"


如果postgres2，node_id 1为down, 那么在postgres2机器上执行
postgres2.local
pcp_attach_node -h 127.0.0.1 -p 9898 -U pgpool -n 1


psql -h 127.0.0.1 -p 9999 -U pgpool postgres -c "show pool_nodes"







