#!/bin/bash

export $(cat env)

urn=$(RAD_HOME=/tmp/socket-activated-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
   identities person create new --payload '{"name": "sockpuppet"}' | jq -r '.urn');
RAD_HOME=/tmp/socket-activated-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p rad -- \
   identities local set --urn $urn
