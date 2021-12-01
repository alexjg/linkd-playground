export $(cat env)

profile_id=$(RAD_HOME=/tmp/socket-activated-home \
    cargo +nightly-2021-06-17 run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        --release \
        -p rad -- profile get);
api_socket=/tmp/socket-activated-home/$profile_id/sockets/api;
event_socket=/tmp/socket-activated-home/$profile_id/sockets/events;
seed_peer_id=$(RAD_HOME=/tmp/seed-home \
    cargo +nightly-2021-06-17 run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        --release \
        -p rad -- profile peer);
cargo +nightly-2021-06-17 build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p linkd;
systemd-socket-activate \
    -l $api_socket \
    -l $event_socket \
    --fdname=api:events \
    -E SSH_AUTH_SOCK \
    ./target/release/linkd \
    --rad-home /tmp/socket-activated-home \
    --bootstrap $seed_peer_id@127.0.0.1:8799 \
    --linger-timeout 10000 \
    --protocol-listen 127.0.0.1:8899
