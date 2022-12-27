#!/bin/bash
# -----------------------
# Install Bat
# -----------------------
set -o allexport; source config/.env; set +o allexport

wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_${BAT_ARCH}.deb

sudo dpkg -i bat_${BAT_VERSION}_${BAT_ARCH}.deb
rm bat_${BAT_VERSION}_${BAT_ARCH}.deb

