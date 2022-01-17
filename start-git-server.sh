export $(cat env)

cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p linkd-git -- /tmp/socket-activated-home 127.0.0.1:9876
