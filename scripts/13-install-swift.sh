#!/bin/bash
# ------------------------------------
# Install Swift wasm support
# ------------------------------------
set -o allexport; source config/.env; set +o allexport

wget "https://github.com/swiftwasm/swift/releases/download/swift-wasm-${SWIFT_VERSION}-RELEASE/swift-wasm-${SWIFT_VERSION}-RELEASE-${SWIFT_ARCH}.tar.gz"

sudo tar -C /usr/local -xzf swift-wasm-${SWIFT_VERSION}-RELEASE-${SWIFT_ARCH}.tar.gz

echo "" >> ${HOME}/.bashrc
echo "export SWIFT_HOME=\"/usr/local/swift-wasm-${SWIFT_VERSION}-RELEASE\"" >> ${HOME}/.bashrc
echo "export PATH=\"\$SWIFT_HOME/usr/bin:\$PATH\"" >> ${HOME}/.bashrc

source ${HOME}/.bashrc

rm swift-wasm-${SWIFT_VERSION}-RELEASE-${SWIFT_ARCH}.tar.gz
