
# To set up pagure instead
REPO=$1
DOMAIN=${2-pagure.io}
git clone https://${DOMAIN}/forks/dustymabe/${REPO}.git
pushd $(basename $REPO)
git remote set-url --push origin ssh://git@${DOMAIN}/forks/dustymabe/${REPO}.git
git remote add upstreamorigin https://${DOMAIN}/${REPO}.git
git fetch upstreamorigin
git checkout -t remotes/upstreamorigin/master -b upstreammaster
git checkout master
popd
exit
