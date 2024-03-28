https://stackoverflow.com/questions/39375613/automatic-recovery-of-the-failed-postgresql-master-node-is-not-working-with-pgpo

在每个节点依次执行



sudo find / -name pgpool_status
rm -rf /var/log/pgpool
cat /var/log/pgpool/pgpool_status

cd /var/log/pgpool


systemctl stop postgresql-14.service
systemctl restart postgresql-14.service
systemctl restart pgpool-II
journalctl -u pgpool-II --no-pager | tail -n 1000

journalctl -u postgresql-14.service --no-pager | tail -n 1000



systemctl status pgpool-II
systemctl status postgresql-14.service

systemctl stop postgresql-14.service
systemctl stop pgpool-II
systemctl disable  postgresql-14.service
systemctl disable  pgpool-II
rm -rf "/var/lib/pgsql/14/data/"


如果postgres2，node_id 1为down, 那么在postgres2机器上执行
postgres2.local




postmaster: could not access directory "/var/lib/pgsql/14/data": No such file or directory

pcp_recovery_node -h 127.0.0.1 -p 9898 -U pgpool -n 1


psql -h 127.0.0.1 -p 9999 -U pgpool postgres -c "show pool_nodes"


pcp_recovery_node: 这个命令用于恢复一个已经失败的数据库节点。当数据库节点由于硬件故障或者其他原因导致宕机时，运行pcp_recovery_node命令可以将宕机的节点重新启动并加入集群，让集群恢复正常运行状态。


总结：

pcp_recovery_node用于恢复故障节点。





从节点无法恢复


？？？？？ 2节点一直down, 无法pcp recovery ，发现是postgres启动不起来，
发现是postgres /var/lib/pgsql/14/data 不见了？？？

su - postgres
mkdir /var/lib/pgsql/14/data
/usr/pgsql-14/bin/initdb -D /var/lib/pgsql/14/data/ -E utf8 --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'
pcp_recovery_node -h 127.0.0.1 -p 9898 -U pgpool -n 2



https://blog.csdn.net/Darren_tan/article/details/104530338

