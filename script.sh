#!/bin/bash
dymd init "$MONIKER_NAME" --chain-id "$CHAIN_ID" 
dymd keys add "$KEY_NAME" --keyring-backend test
#     dymd add-genesis-account "$(dymd keys show "$KEY_NAME" -a --keyring-backend test)" 100000000000stake && \
#     dymd gentx "$KEY_NAME" 100000000stake --chain-id "$CHAIN_ID" --keyring-backend test && \
#     dymd collect-gentxs
CHAIN_ID=local-testnet 
KEY_NAME=wallet 
MONIKER_NAME=${MONIKER_NAME:-local}

dymd version
dymd help
dymd start
