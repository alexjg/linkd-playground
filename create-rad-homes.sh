export $(cat env)

echo "Create socket activated profile"
RAD_HOME=/tmp/socket-activated-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
    profile create 

echo "Create seed profile"
RAD_HOME=/tmp/seed-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
    profile create 
