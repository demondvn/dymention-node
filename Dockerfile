# Set the base image to Golang
FROM golang:latest

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl tar wget clang pkg-config libssl-dev jq build-essential git make ncdu

# Clone the Dymension repository
RUN git clone https://github.com/dymensionxyz/dymension.git --branch v0.2.0-beta

# Set the working directory
# Build and install Dymension
RUN cd dymension &&   make install


# Set the environment variables
ENV CHAIN_ID=local-testnet \
    KEY_NAME=local-user \
    MONIKER_NAME=local

# Initialize the local testnet
RUN dymd init "$MONIKER_NAME" --chain-id "$CHAIN_ID" && \
    dymd keys add "$KEY_NAME" --keyring-backend test && \
    dymd add-genesis-account "$(dymd keys show "$KEY_NAME" -a --keyring-backend test)" 100000000000stake && \
    dymd gentx "$KEY_NAME" 100000000stake --chain-id "$CHAIN_ID" --keyring-backend test && \
    dymd collect-gentxs

# Expose the necessary ports
EXPOSE 26656 26657

# Start the Dymension node
CMD ["dymd", "start"]
