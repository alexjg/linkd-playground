set -euo pipefail
export $(cat env)

#RUSTFLAGS="--cfg tokio_unstable" cargo build \
cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- "$@"
