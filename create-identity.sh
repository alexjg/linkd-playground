#!/bin/bash

export $(cat env)

urn=$(LNK_HOME=/tmp/socket-activated-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p lnk -- \
   identities person create new --payload '{"name": "sockpuppet"}' | jq -r '.urn');
LNK_HOME=/tmp/socket-activated-home \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    --release \
    -p lnk -- \
   identities local set --urn $urn
