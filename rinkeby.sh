#!/usr/bin/env bash

geth \
--rinkeby \
--fast \
--rpc \
--rpcport 8544 \
--port 38544 \
--unlock 0x03cda1f3deeae2de4c73cfc4b93d3a50d0419c24 \
--password <(echo Welcome1)
