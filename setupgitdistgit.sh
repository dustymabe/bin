#!/bin/bash
set -eux

# To set up pagure instead
REPO=$1
USER='dustymabe'
DOMAIN1='src.fedoraproject.org'
DOMAIN2='pkgs.fedoraproject.org'
#git clone https://${DOMAIN1}/forks/${USER}/${REPO}
git clone https://${DOMAIN1}/forks/${USER}/rpms/${REPO}
pushd $(basename $REPO)
git remote set-url --push origin ssh://${DOMAIN2}/forks/${USER}/${REPO}.git
git remote add upstreamorigin https://${DOMAIN1}/${REPO}.git
git fetch upstreamorigin
git checkout -t remotes/upstreamorigin/master -b upstreammaster
git checkout master
popd
