#!/bin/bash

set -o allexport; source config/.env; set +o allexport

multipass --verbose exec ${VM_NAME} -- bash <<EOF
echo "👋 hello world 🌍"
EOF

#multipass --verbose exec ${VM_NAME} -- sudo -- bash <<EOF
#
#EOF

#VM_IP=$(multipass info ${VM_NAME} | grep IPv4 | awk '{print $2}')
#multipass exec ${VM_NAME} -- sudo -- sh -c "echo \"${VM_IP} ${VM_DOMAIN}\" >> /etc/hosts"
