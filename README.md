# dymention-node

## Build
    docker build . -t dymension
## Run
    docker run  -d -v /mnt/blockstore/dymension:/root/.dymension -e NODE_MONIKER=MonPham --name dymension dymension:latest
## If error
    update config/config.toml edit moniker
