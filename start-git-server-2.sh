set -euo pipefail
export $(cat env)

#RUSTFLAGS="--cfg tokio_unstable" cargo build \
cargo build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk-gitd;
peer_id=$(LNK_HOME=/tmp/link-local-2 \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        -p lnk -- profile peer);

systemd-socket-activate \
    -l 9988 \
    --fdname=ssh \
    -E SSH_AUTH_SOCK \
    -E RUST_BACKTRACE \
    -E RUST_LOG=librad=trace,link_crypto=trace,gitd_lib=trace,rustls=trace,futures_lite=trace \
    ./target/debug/lnk-gitd \
    /tmp/link-local-2 \
    --linkd-rpc-socket $XDG_RUNTIME_DIR/link-peer-$peer_id-rpc.socket \
    --push-seeds \
    --fetch-seeds \
    --linger-timeout 10000
