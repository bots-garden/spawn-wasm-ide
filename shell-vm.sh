#!/bin/bash
set -o allexport; source config/.env; set +o allexport
multipass shell ${VM_NAME}

