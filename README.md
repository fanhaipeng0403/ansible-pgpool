# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

sudo yum install epel-release
sudo yum install ansible
ansible-galaxy collection install community.general

ansible-playbook -k generate-key-use-password.yml  -i inventory.ini
ansible-playbook postgresql14_install.yml -i inventory.ini

替换
172.16.3.168
172.16.3.168.0


