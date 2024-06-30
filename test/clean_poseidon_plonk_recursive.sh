#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_DIR=$DIR/".."
CIRCUIT_DIR=$DIR"/circuits/poseidon_recursive"
CONTRACT_TEST_DIR=$DIR"/contract/recursive"

# Find and remove all files except *.circom and input.json
find "$CIRCUIT_DIR" -type f ! -name "*.circom" ! -name "input.json" -exec rm -f {} \;

# rm *.sol and *.json
rm $CONTRACT_TEST_DIR/contracts/verifier.sol
rm $CONTRACT_TEST_DIR/test/data/proof.json

echo "Unwanted files have been removed."
