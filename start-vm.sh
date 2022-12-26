#!/bin/bash
set -o allexport; source config/.env; set +o allexport
multipass start ${VM_NAME}

VM_IP=$(multipass info ${VM_NAME} | grep IPv4 | awk '{print $2}')

multipass --verbose exec ${VM_NAME} -- bash <<EOF
cd openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}
./bin/openvscode-server --port ${OPENVSCODE_SERVER_PORT} --host ${VM_IP} --without-connection-token &
echo "🌍 http://${VM_IP}:8080/?folder=/home/ubuntu/scripts"
echo "🌍 http://${VM_IP}:8080/?folder=/home/ubuntu/workspace"
EOF

