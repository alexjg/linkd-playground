export $(cat env)

echo "Adding link local 1"
LNK_HOME=/tmp/link-local-1 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile ssh add

echo "Adding link local 2"
LNK_HOME=/tmp/link-local-2 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile ssh add

echo "Adding seed key"
LNK_HOME=/tmp/seed-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
    profile ssh add
