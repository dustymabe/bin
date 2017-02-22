
# To set up pagure instead
REPO=$1
git clone https://pagure.io/forks/dustymabe/${REPO}.git
pushd $REPO
git remote set-url --push origin ssh://git@pagure.io/forks/dustymabe/${REPO}.git
git remote add upstreamorigin https://pagure.io/${REPO}.git
git fetch upstreamorigin
git checkout -t remotes/upstreamorigin/master -b upstreammaster
git checkout master
popd


