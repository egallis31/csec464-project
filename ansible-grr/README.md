# ansible-grr

## Running

* Run `./install-ansible-latest.sh`
* Edit variables in `inventory` if needed
* Run `ansible-playbook -i inventory grr-demo.yml`
  * Will need root privileges depending on configuration of system/inventory

## Roles

* install-docker
  * installs docker and pip requirements for ansible docker
* grr-server-install
  * sets up docker grr server with config file
  * waits for server to generate packages for clients
* grr-client-install
  * pulls grr client package from grr server
  * install and ensure auto start from boot
