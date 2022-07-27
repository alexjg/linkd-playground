set -euo pipefail
export $(cat env)

echo "Create local link peer 1"
LNK_HOME=/tmp/link-local-1 ./lnk.sh profile create

echo "Create local link peer 2"
LNK_HOME=/tmp/link-local-2 ./lnk.sh profile create

echo "Create seed profile"
LNK_HOME=/tmp/seed-home ./lnk.sh profile create
