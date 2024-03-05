https://www.cnblogs.com/xianghuaqiang/p/13887482.html
# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

http://liuguangxuan.top/index.php/archives/40/

sudo yum install epel-release -y
sudo yum install ansible -y
sudo yum install git -y
ansible-galaxy collection install community.general
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -k generate-key-use-password.yml  -i inventory.ini


ansible-playbook postgresql14_install.yml -i inventory.ini
ansible-playbook verify.yml -i inventory.ini


