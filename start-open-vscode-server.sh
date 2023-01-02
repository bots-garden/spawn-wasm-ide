#!/bin/bash
# --------------------------------------
# This script is only for RPI install
# --------------------------------------
set -o allexport; source config/.env; set +o allexport

VM_IP="0.0.0.0"
echo "🚀 Start OpenVSCode Server"
cd openvscode-server-v${OPENVSCODE_SERVER_VERSION}-${OPENVSCODE_SERVER_OS}-${OPENVSCODE_SERVER_ARCH}
./bin/openvscode-server --port ${OPENVSCODE_SERVER_PORT} --host ${VM_IP} --without-connection-token &


