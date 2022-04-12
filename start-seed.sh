export $(cat env)

cargo build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p linkd;
./target/debug/linkd \
    --lnk-home /tmp/seed-home \
    --track everything \
    --protocol-listen 127.0.0.1:8799
