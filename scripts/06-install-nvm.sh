#!/bin/bash
set -o allexport; source config/.env; set +o allexport
#sudo snap install node --classic --channel=19
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
source $HOME/.bashrc
nvm install ${NODEJS_VERSION}
#nvm use ${NODEJS_VERSION}
