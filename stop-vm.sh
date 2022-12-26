#!/bin/bash
set -o allexport; source config/.env; set +o allexport
multipass stop ${VM_NAME}
