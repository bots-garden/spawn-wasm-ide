#!/bin/bash
# ------------------------------------
# Install k8s tools
# ------------------------------------
set -o allexport; source config/.env; set +o allexport

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${KUBECTL_ARCH}/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
