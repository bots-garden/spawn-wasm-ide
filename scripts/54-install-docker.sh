#!/bin/bash
# ------------------------------------
# Install Docker
# ------------------------------------
set -o allexport; source config/.env; set +o allexport

sudo apt install docker.io -y 

