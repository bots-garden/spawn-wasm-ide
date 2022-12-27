#!/bin/bash

set -o allexport; source config/.env; set +o allexport

multipass --verbose exec ${vm_name} -- bash <<EOF
echo "👋 hello world 🌍"
EOF

#multipass --verbose exec ${vm_name} -- sudo -- bash <<EOF
#
#EOF
