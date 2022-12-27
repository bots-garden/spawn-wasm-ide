#!/bin/bash
set -o allexport; source config/.env; set +o allexport


echo "Installing Go & TinyGo"

# -----------------------
# Install GoLang
# -----------------------
wget https://go.dev/dl/go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_ARCH}.tar.gz

sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_ARCH}.tar.gz

echo "" >> ${HOME}/.bashrc
echo "export GOLANG_HOME=\"/usr/local/go\"" >> ${HOME}/.bashrc
echo "export PATH=\"\$GOLANG_HOME/bin:\$PATH\"" >> ${HOME}/.bashrc

source ${HOME}/.bashrc
#source ~/.bashrc

rm go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_ARCH}.tar.gz

# -----------------------
# Install TinyGo
# -----------------------
wget https://github.com/tinygo-org/tinygo/releases/download/v${TINYGO_VERSION}/tinygo_${TINYGO_VERSION}_${TINYGO_ARCH}.deb
sudo dpkg -i tinygo_${TINYGO_VERSION}_${TINYGO_ARCH}.deb
rm tinygo_${TINYGO_VERSION}_${TINYGO_ARCH}.deb
