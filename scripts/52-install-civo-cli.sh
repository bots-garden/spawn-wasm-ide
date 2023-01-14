#!/bin/bash
# ------------------------------------
# Install civo cli
# ------------------------------------
set -o allexport; source config/.env; set +o allexport

curl -sL https://civo.com/get | sh
sudo mv /tmp/civo /usr/local/bin/civo