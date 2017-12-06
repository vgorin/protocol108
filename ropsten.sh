#!/usr/bin/env bash

geth \
--testnet \
--fast \
--rpc \
--rpcport 8543 \
--port 38543 \
--unlock 0x03cda1f3deeae2de4c73cfc4b93d3a50d0419c24 \
--password <(echo Welcome1)
