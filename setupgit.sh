
TOPLEVEL=$1
REPO=$2
git clone https://github.com/dustymabe/${REPO}.git
pushd $REPO
git remote set-url --push origin git@github.com:dustymabe/${REPO}.git
git remote add upstreamorigin https://github.com/${TOPLEVEL}/${REPO}.git
git fetch upstreamorigin
output=$(git remote show upstreamorigin | grep 'HEAD branch')
regex='^  HEAD branch: (.*)$'
if [[ ! "$output" =~ $regex ]]; then echo "failed to find branch"; fi
branch=${BASH_REMATCH[1]}
git checkout -t "remotes/upstreamorigin/${branch}" -b "upstream${branch}"
git checkout $branch
popd
exit

# Add last line of following to be able to pull down PRs
#   [remote "upstreamorigin"]
#       fetch = +refs/heads/*:refs/remotes/origin/*
#       url = git@github.com:joyent/node.git
#       fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
# Now git fetch upstreamorigin

# For a completely private repo
TOPLEVEL=$1
REPO=$2
git clone git@github.com:${TOPLEVEL}/${REPO}.git
pushd $REPO
git remote set-url --push origin git@github.com:dustymabe/${REPO}.git
git remote add upstreamorigin git@github.com:${TOPLEVEL}/${REPO}.git
git fetch upstreamorigin
git checkout -t remotes/upstreamorigin/master -b upstreammaster
git checkout master
popd
exit

