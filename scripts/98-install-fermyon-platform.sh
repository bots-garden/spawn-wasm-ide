#!/bin/bash
# ------------------------------------
# Install Fermyon platform
# ------------------------------------

set -o allexport; source config/.env; set +o allexport

# ++++++++++++++++++++++++++++++++++++
# Install Nomad
# ++++++++++++++++++++++++++++++++++++
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
#sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# 🖐️ put arch in env var
sudo apt-add-repository "deb [arch=${NOMAD_ARCH}] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update && sudo apt-get install nomad -y
nomad --version

# ++++++++++++++++++++++++++++++++++++
# Install Consul
# ++++++++++++++++++++++++++++++++++++
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul -y
consul --version
