sudo yum install epel-release -y
sudo yum install ansible -y
ansible-galaxy collection install community.general
ansible-playbook generate-key-use-password.yml  -i inventory.ini
ansible-playbook postgresql14_install.yml -i inventory.ini
