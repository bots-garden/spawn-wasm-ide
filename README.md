# spawn-wasm-ide

## Create the VM + tools installation

- Update the configuration environment variables: `./config/.env`
- Create the VM: `./create-vm.sh`
- Open the WEB IDE with this url [http://<IP_ADDRESS_OF_THE_VM>:8080/?folder=/home/ubuntu/scripts](http://<IP_ADDRESS_OF_THE_VM>:8080/?folder=/home/ubuntu/scripts)
  - see this file `./config/vm.hosts.config` to get the IP address of the VM
- run this command `. install.sh` to install all tools, language support, runtimes...

## Other useful commands

- Stop the VM: `./stop-vm.sh`
- Start the VM: `./start-vm.sh`
- SSH connect: `./shell-vm.sh`
- Drop the VM: `./destroy-vm.sh`