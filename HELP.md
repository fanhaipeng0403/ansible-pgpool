在每个节点依次执行



sudo find / -name pgpool_status
rm -rf /var/log/pgpool/pgpool_status
cat /var/log/pgpool/pgpool_status

cd /var/log/pgpool

systemctl restart postgresql-14.service
systemctl restart pgpool-II


https://blog.csdn.net/zhaizhai6_6/article/details/106765701
