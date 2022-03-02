export $(cat env)

echo "Adding socket activated key"
LNK_HOME=/tmp/socket-activated-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p lnk -- \
    profile ssh add

echo "Adding seed key"
LNK_HOME=/tmp/seed-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p lnk -- \
    profile ssh add
