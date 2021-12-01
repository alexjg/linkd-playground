#!/bin/bash

export $(cat env)

urn=$(RAD_HOME=/tmp/socket-activated-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
   identities person create new --payload '{"name": "sockpuppet"}' | jq -r '.urn');
RAD_HOME=/tmp/socket-activated-home \
    cargo +nightly-2021-06-17 run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
   identities local set --urn $urn
