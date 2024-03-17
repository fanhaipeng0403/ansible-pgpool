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



https://blog.csdn.net/zhaizhai6_6/article/details/106765701



https://blog.csdn.net/Kangyucheng/article/details/108676026

pcp_attach_node -h 127.0.0.1 -p 9898 -U pgpool -n 1