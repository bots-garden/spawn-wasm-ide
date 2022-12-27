# spawn-wasm-ide

This project allows to create a Multipass VM with OpenVSCode server installed. And it provides all the scripts to install various tools if you want to develop with WebAssembly (WASM and WASI).

✋ I'm vorking on a MacBook Pro M1 (arm architecture), so, before creating the VM, check the values set in `./config/.env` (like `OPENVSCODE_SERVER_ARCH="arm64"`) and set in `./scripts/config/.env` (like `GOLANG_ARCH="arm64"`, `TINYGO_ARCH="arm64"`...).

## Create the VM and tools installation

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