#!/bin/bash

# -----------------------
# Install Rust support
# -----------------------
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

echo "export CARGO_HOME=\"\$HOME/.cargo\"" >> ${HOME}/.bashrc
echo "export PATH=\"\$CARGO_HOME/bin:\$PATH\"" >> ${HOME}/.bashrc
