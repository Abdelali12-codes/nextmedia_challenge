#!/bin/bash

# install docker

sudo apt update && sudo apt install docker.io -y

# install docker compose
{
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}
# install ansible 

sudo apt install python-pip -y

# switch to the root user

sudo su
pip install ansible

# switch back to your regular user
su - username

# create /etc/ansible directory 

sudo mkdir -p /etc/ansible

# create the inventory file under /etc/ansible and copy and paste 
#the content of the host file under ansible directory of the project to your file

sudo nano /etc/ansible/hosts

# next steps are very important

# edit the sshd_config file to allow the passwordauthentication

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# restart the ssh service

sudo service ssh restart

# generate ssh keys on your machine
ssh-keygen -t rsa # keep hitting enter then it will generated and stored under ~/.ssh

# copy the public key and private key from the server you want to have control over it
ssh-keyscan -H username@ip_add # in our case ssh-keyscan -H 
# copy your public key id_rsa.pub to your localhost either by using ssh-copy-id or manully to ~/.ssh/authorized_keys

ssh-copy-id localhost

# check wether if you are connected to the hosts defined in hosts file 

ansible all -m ping

# if you set everything properly you will have green message otherwise 
# you must to review the previous steps and repeat the procedure

# install the docker and docker-compose modules
pip install docker docker-compose
# now run you play book

ansible-playbook ansible-playbook.yml
