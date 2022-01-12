# nginx-php-haproxy-waf-using-ansible-dockercompose

# Overview of the project

![alt txt](archeticture.png?raw=true)

# Prerequisites

- Docker
- Docker Compose
- Pulling nginx, Haproxy and the php images from dockerhub

# Technical Description

- Docker network subnet: 10.10.0.0/16
- HAproxy loadbalancer IP address is: 10.10.0.20
- Nginx web server IP address is: 10.10.0.12

* Expose the nginx and HAProxy on port 80 (Container Side)
* EXPOSE the php service on Port 9000 from within the cluster

# The project Architecture

![alt text](challenge.png?raw=true)

# Installation Steps:

- clone the repo
- follow the instructions that are in the script.sh file
