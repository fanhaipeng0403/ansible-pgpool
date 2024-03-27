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




postmaster: could not access directory "/var/lib/pgsql/14/data": No such file or directory

pcp_recovery_node -h 127.0.0.1 -p 9898 -U pgpool -n 2


psql -h 127.0.0.1 -p 9999 -U pgpool postgres -c "show pool_nodes"

pcp_recovery_node和pgpcp_attach_node是PostgreSQL的pgpool-II管理工具(PCP)提供的两个命令，用于管理pgpool-II数据库集群中的节点。

pcp_recovery_node: 这个命令用于恢复一个已经失败的数据库节点。当数据库节点由于硬件故障或者其他原因导致宕机时，运行pcp_recovery_node命令可以将宕机的节点重新启动并加入集群，让集群恢复正常运行状态。

pgpool_attach_node: 这个命令用于将一个新的数据库节点添加到pgpool-II集群中。通过运行pgpool_attach_node命令，可以将一个新的数据库节点加入到集群中，以扩展集群的容量或者实现高可用性。

总结：

pcp_recovery_node用于恢复故障节点。
pgpcp_attach_node用于添加新节点到集群。





从节点无法恢复


？？？？？ 2节点一直down, 无法pcp recovery ，发现是postgres启动不起来，
发现是postgres /var/lib/pgsql/14/data 不见了？？？


https://blog.csdn.net/Darren_tan/article/details/104530338

