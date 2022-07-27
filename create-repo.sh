set -euo pipefail
export $(cat env)

LNK_HOME=/tmp/link-local-1 ./lnk.sh identities project create new --path ./theproject --payload '{"name": "theproject", "default_branch": "master"}'
