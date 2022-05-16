set -euo pipefail
export $(cat env)

LNK_HOME=/tmp/link-local-1 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    identities project create new --path ./theproject --payload '{"name": "theproject", "default_branch": "master"}'
