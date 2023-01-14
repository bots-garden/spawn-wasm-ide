#!/bin/bash
# ------------------------------------
# Install k9s
# ------------------------------------
git clone https://github.com/derailed/k9s.git
cd k9s
make build #&& ./execs/k9s
sudo cp ./execs/k9s /usr/bin
cd ..
rm -rf k9s

