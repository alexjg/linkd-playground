export $(cat env)

echo "Adding link local 1"
LNK_HOME=/tmp/link-local-1 ./lnk.sh profile ssh add

echo "Adding link local 2"
LNK_HOME=/tmp/link-local-2 ./lnk.sh profile ssh add

echo "Adding seed key"
LNK_HOME=/tmp/seed-home ./lnk.sh profile ssh add
