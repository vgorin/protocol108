#!/usr/bin/env bash

rm -rf build

truffle deploy --reset --network=ropsten
