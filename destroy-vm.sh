#!/bin/bash
set -o allexport; source config/.env; set +o allexport
multipass delete ${VM_NAME}
multipass purge

rm  config/*.config

