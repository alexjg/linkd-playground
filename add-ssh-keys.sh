export $(cat env)

echo "Adding socket activated key"
RAD_HOME=/tmp/socket-activated-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
    profile ssh add

echo "Adding seed key"
RAD_HOME=/tmp/seed-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
    profile ssh add
