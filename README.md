https://www.cnblogs.com/xianghuaqiang/p/13887482.html

阿里云的虚拟IP（Virtual IP，简称 VIP）是指在同一地域内的同一私网中，可以通过配置虚拟IP地址，将多个ECS实例映射到同一个IP地址上，从而实现高可用性和负载均衡。

使用虚拟IP可以使多个ECS实例共享同一个IP地址，从而在ECS实例之间实现负载均衡，提高系统的可用性和可靠性。虚拟IP可以用于负载均衡、高可用性、容灾备份等场景，可以根据业务需求进行相应的配置。

在阿里云控制台上，创建虚拟IP非常简单。首先，在ECS控制台上创建ECS实例，然后在负载均衡控制台上创建负载均衡实例，再在虚拟IP控制台上创建虚拟IP并绑定到负载均衡实例上即可。

# ansible playbook for installing postgres-pgool
for pgpool version 4.3.x

sudo yum install epel-release -y
sudo yum install ansible -y
ansible-galaxy collection install community.general
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -k generate-key-use-password.yml  -i inventory.ini


ansible-playbook postgresql14_install.yml -i inventory.ini
ansible-playbook verify.yml -i inventory.ini


