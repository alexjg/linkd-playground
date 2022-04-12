export $(cat env)

cargo build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk-gitd;
peer_id=$(LNK_HOME=/tmp/socket-activated-home \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        -p lnk -- profile peer);

systemd-socket-activate \
    -l 9987 \
    --fdname=ssh \
    -E SSH_AUTH_SOCK \
    -E RUST_BACKTRACE \
    -E RUST_LOG \
    ./target/debug/lnk-gitd \
    /tmp/socket-activated-home \
    --linkd-rpc-socket $XDG_RUNTIME_DIR/link-peer-$peer_id-rpc.socket \
    --linger-timeout 10000 \
    --announce-on-push
