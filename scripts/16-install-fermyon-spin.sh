#!/bin/bash
# ------------------------------------
# Install Spin
# ------------------------------------
set -o allexport; source config/.env; set +o allexport
mkdir tmp
cd tmp
wget https://github.com/fermyon/spin/releases/download/v${SPIN_VERSION}/spin-v${SPIN_VERSION}-${SPIN_ARCH}.tar.gz
tar xvf spin-v${SPIN_VERSION}-${SPIN_ARCH}.tar.gz
sudo mv ./spin /usr/local/bin/spin
rm spin-v${SPIN_VERSION}-${SPIN_ARCH}.tar.gz

#echo "" >> ${HOME}/.bashrc
#echo "export SPIN_HOME=\"/usr/local\"" >> ${HOME}/.bashrc
#echo "export PATH=\"\$SPIN_HOME:\$PATH\"" >> ${HOME}/.bashrc

#source ${HOME}/.bashrc
spin --version

cd ..
rm -rf tmp


