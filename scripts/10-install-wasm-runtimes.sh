#!/bin/bash

# -----------------------
# Install Wasi Runtimes
# -----------------------

#curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -v 0.10.0
curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash

source ${HOME}/.wasmedge/env
#. ${HOME}/.wasmedge/env

curl https://get.wasmer.io -sSfL | sh
source ${HOME}/.wasmer/wasmer.sh
#. ${HOME}/.wasmer/wasmer.sh

curl https://wasmtime.dev/install.sh -sSf | bash
source ${HOME}/.bashrc
#. ${HOME}/.bashrc


