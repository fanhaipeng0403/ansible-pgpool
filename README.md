https://www.cnblogs.com/xianghuaqiang/p/13887482.html
https://github.com/davidepolli/ansible-pgpool
# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

http://liuguangxuan.top/index.php/archives/40/

scp -r /Users/fanhaipeng/ansible-pgpool/* root@47.97.205.74:/root/ansible-pgpool

sudo yum install epel-release -y
sudo yum install ansible -y
ansible-galaxy collection install community.general
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -k generate-key-use-password.yml  -i inventory.ini

ansible-playbook postgresql14_install.yml -i inventory.ini


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



 ip addr show | grep -i "172.16.122.108'

 psql -h 127.0.0.1 -U postgres -p 5432
 psql -h 192.168.56.40 -p 5432 -U postgres
 psql -h 192.168.56.40 -p 9999 -U postgres


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



 cat /var/lib/pgsql/14/data/pg_hba.conf
 cat /etc/pgpool-II/pgpool.conf
