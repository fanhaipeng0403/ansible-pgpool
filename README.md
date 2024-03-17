https://blog.csdn.net/qq_35550345/article/details/114073813
https://www.cnblogs.com/xianghuaqiang/p/13887482.html
https://github.com/davidepolli/ansible-pgpool
# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

http://liuguangxuan.top/index.php/archives/40/

scp -r /Users/fanhaipeng/ansible-pgpool/* root@121.199.32.94:/root/ansible-pgpool

sudo yum install epel-release -y
sudo yum install ansible -y
ansible-galaxy collection install community.general
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook generate-key-use-password.yml  -i inventory.ini

ansible-playbook main.yml -i inventory.ini



systemctl restart pgpool-II
systemctl restart postgresql-14.service

journalctl -u pgpool-II --no-pager | tail -n 1000



cat /usr/lib/systemd/system/postgresql-14.service
systemctl status postgresql-14.service
systemctl restart postgresql-14.service
journalctl -u postgresql-14.service -f

cat /usr/lib/systemd/system/pgpool-II.service
systemctl status pgpool-II
systemctl stop pgpool-II
systemctl start pgpool-II
/usr/bin/pgpool -n
journalctl -u pgpool-II -f


# 功能验证用到的命令
psql -h 127.0.0.1  -p 9999 -U postgres
psql -h 127.0.0.1  -p 5432 -U postgres
show pool_nodes;


 create table game_room
  (
      id                bigserial
          primary key,
      room_id           integer
          unique,
      sb                bigint,
      bb                bigint,
      min_buy_in        bigint,
      max_buy_in        bigint,
      timeout           integer,
      max               integer,
      level             smallint,
      room_type         smallint,
      sng_detail        json,
      tournament_buy_in json,
      keep_table_count  bigint,
      room_bg           text,
      table_bg          text,
      is_available      boolean
  );


INSERT INTO game_room (id, room_id, sb, bb, min_buy_in, max_buy_in, timeout, max, level, room_type, sng_detail,

                              tournament_buy_in, is_available)
VALUES (1, 1, 1000, 2000, 50000, 300000, 10, 6, 1, 1, null, null, true);

select * from game_room;


show pool_nodes;

 select pg_is_in_recovery();

pcp_recovery_node -h 172.16.212.100 -p 9898 -U pgpool -n 1
pcp_watchdog_info -h 172.16.212.100 -p 9898 -U pgpool
psql -h 172.16.212.100 -p 9999 -U pgpool postgres -c "show pool_nodes"
pg_ctl -D /var/lib/pgsql/11/data -m immediate stop
psql -h slave -p 5432 -U pgpool postgres -c "select pg_is_in_recovery()"


