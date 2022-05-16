#!/bin/bash
set -euo pipefail

export $(cat env)

echo "Creating local link 1 identity"
urn1=$(LNK_HOME=/tmp/link-local-1 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
   identities person create new --payload '{"name": "sockpuppet1"}' | jq -r '.urn');
LNK_HOME=/tmp/link-local-1 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
   identities local set --urn $urn1

echo "Creating local link 2 identity"
urn2=$(LNK_HOME=/tmp/link-local-2 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
   identities person create new --payload '{"name": "sockpuppet2"}' | jq -r '.urn');
LNK_HOME=/tmp/link-local-2 \
    cargo run \
    --target-dir ./target \
    --manifest-path $LINK_CHECKOUT/bins/Cargo.toml \
    -p lnk -- \
   identities local set --urn $urn2
