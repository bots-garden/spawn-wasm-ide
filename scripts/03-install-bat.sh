#!/bin/bash
# -----------------------
# Install Bat
# -----------------------
BAT_VERSION="0.22.1"
BAT_ARCH="arm64"

wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_${BAT_ARCH}.deb

sudo dpkg -i bat_${BAT_VERSION}_${BAT_ARCH}.deb
rm bat_${BAT_VERSION}_${BAT_ARCH}.deb

