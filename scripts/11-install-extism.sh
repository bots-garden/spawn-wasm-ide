#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y pkg-config

sudo apt install python3-pip -y
pip3 install poetry
pip3 install git+https://github.com/extism/cli

echo "export EXTISM_HOME=\"\$HOME/.local\"" >> ${HOME}/.bashrc
echo "export PATH=\"\$EXTISM_HOME/bin:\$PATH\"" >> ${HOME}/.bashrc

source ${HOME}/.bashrc

extism install latest

