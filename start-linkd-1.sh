export $(cat env)

profile_id=$(LNK_HOME=/tmp/link-local-1 \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        -p lnk -- profile get);
peer_id=$(LNK_HOME=/tmp/link-local-1 \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        -p lnk -- profile peer);
rpc_socket=$XDG_RUNTIME_DIR/link-peer-$peer_id-rpc.socket;
events_socket=$XDG_RUNTIME_DIR/link-peer-$peer_id-events.socket;
seed_peer_id=$(LNK_HOME=/tmp/seed-home \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        -p lnk -- profile peer);
cargo build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p linkd;
systemd-socket-activate \
    -l $rpc_socket \
    -l $events_socket \
    --fdname=rpc:events \
    -E SSH_AUTH_SOCK \
    ./target/debug/linkd \
    --lnk-home /tmp/link-local-1 \
    --bootstrap $seed_peer_id@127.0.0.1:8799 \
    --linger-timeout 10000 \
    --protocol-listen 127.0.0.1:8899
