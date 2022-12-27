#!/bin/bash
# ------------------------------------
# Install Java
# ------------------------------------
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install java 19.0.1-amzn
