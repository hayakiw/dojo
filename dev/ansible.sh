# Ansible Install
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get clean

# run ansible-playbook
ansible-playbook -i /vagrant/dev/ansible/host /vagrant/dev/ansible/develop.yml -D
