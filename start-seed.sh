export $(cat env)

cargo build \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p linkd;
./target/release/linkd \
    --rad-home /tmp/seed-home \
    --track everything \
    --protocol-listen 127.0.0.1:8799
