https://blog.csdn.net/along1976/article/details/113719487
https://blog.csdn.net/qq_37481017/article/details/124933816
https://cloud.tencent.com/developer/article/2154082

分发SSH Key
# 如果主备服务器密码一致，使用如下
ansible-playbook -k generate-key-use-password.yml -i hosts-pgsql-ha


# 如果主备节点密码不一致，则为每台节点手动生成
ssh-keygen -t rsa -b 2048
ssh-copy-id -i ~/.ssh/id_rsa.pub root@server1
ssh-copy-id -i ~/.ssh/id_rsa.pub root@server2
ssh-copy-id -i ~/.ssh/id_rsa.pub root@server3 # ...

- **开始部署**
``` bash
ansible-playbook postgresql-ha.yaml -i hosts-pgsql-ha
```

- **查看节点状态**
``` bash
psql -h '172.16.251.184' -p '9999' -U pgpool postgres ;
```

- **恢复指定node**
``` bash
# 因为第一次部署，除主节点外其他节点都未启动，需要同步数据到其他节点
# 节点故障也可使用该命令恢复启动节点，恢复时间随数据容量增大

su - postgres
pcp_recovery_node -h '172.16.251.184' -p 9898 -U pgpool -n 1
```