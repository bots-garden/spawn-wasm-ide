#!/bin/bash

set -o allexport; source config/.env; set +o allexport

multipass mount $1 ${VM_NAME}:$1

