# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

sudo yum install epel-release
sudo yum install ansible
ansible-galaxy collection install community.general
ansible-playbook -k generate-key-use-password.yml
ansible-playbook postgresql14_install.yml -i inventory.ini


