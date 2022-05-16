set -euo pipefail
export $(cat env)

echo "Create local link peer 1"
LNK_HOME=/tmp/link-local-1 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile create 

echo "Create local link peer 2"
LNK_HOME=/tmp/link-local-2 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile create 

echo "Create seed profile"
LNK_HOME=/tmp/seed-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile create 
