#!/bin/bash

set -o allexport; source config/.env; set +o allexport

echo "🖥️ creating ${VM_NAME}"

multipass launch --name ${VM_NAME} \
--cpus ${VM_CPUS} \
--mem ${VM_MEM} \
--disk ${VM_DISK} \
--cloud-init ./vm.cloud-init.yaml

# share the directories 
multipass mount scripts ${VM_NAME}:scripts
multipass mount workspace ${VM_NAME}:workspace

VM_IP=$(multipass info ${VM_NAME} | grep IPv4 | awk '{print $2}')

multipass info ${VM_NAME}

echo "${VM_IP} ${VM_DOMAIN}" > config/vm.hosts.config

# Install and Start OpenVSCode Server
multipass --verbose exec ${VM_NAME} -- bash <<EOF
echo "💾 Installing OpenVSCode Server"
wget https://github.com/gitpod-io/openvscode-server/releases/download/openvscode-server-v${OPENVSCODE_SERVER_VERSION}/openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}.tar.gz
tar -xzf openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}.tar.gz
rm openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}.tar.gz

echo "🚀 Start OpenVSCode Server"
cd openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}
./bin/openvscode-server --port ${OPENVSCODE_SERVER_PORT} --host ${VM_IP} --without-connection-token &
echo "🌍 http://${VM_IP}:8080/?folder=/home/ubuntu/scripts"
echo "🌍 http://${VM_IP}:8080/?folder=/home/ubuntu/workspace"
EOF

echo "+-----------------------------------------------+"
echo "🖐️ update your /etc/hosts file with:"
cat config/vm.hosts.config
echo "+-----------------------------------------------+"
