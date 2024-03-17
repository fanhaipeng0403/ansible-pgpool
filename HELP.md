在每个节点依次执行



sudo find / -name pgpool_status
rm -rf /var/log/pgpool
cat /var/log/pgpool/pgpool_status

cd /var/log/pgpool


systemctl stop postgresql-14.service
systemctl restart postgresql-14.service
systemctl restart pgpool-II

systemctl stop postgresql-14.service
systemctl stop pgpool-II



https://blog.csdn.net/zhaizhai6_6/article/details/106765701
