#!/bin/bash
# ------------------------------------
# 🚧 DotNet & WASM support in progress
# ------------------------------------
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 7.0.101
#curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 7.0.100-preview.7
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

source ${HOME}/.bashrc

dotnet workload install wasm-tools
