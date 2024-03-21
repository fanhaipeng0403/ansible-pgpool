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








