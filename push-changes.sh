export $(cat env)

RAD_HOME=/tmp/socket-activated-home \
    cargo run \
        --target-dir ./target \
        --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
        --release \
        -p rad -- identities project push \
            --repo-path ./theproject \
            --spec 'refs/heads/main:refs/heads/main'
