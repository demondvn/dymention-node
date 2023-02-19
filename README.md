# dymention-node

## Build
    docker build . -t dymension --build-arg NODE_MONIKER=MonPham
## Run
    docker run  -d -v /mnt/blockstore/dymension:/root/.dymension --name dymension dymension:latest
## If error
    update config/config.toml edit moniker
