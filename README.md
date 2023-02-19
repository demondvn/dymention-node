# dymention-node

## Build
     docker build . -t dymension --build-arg MONIKER_NAME=MonPham
## Run
    docker run  -d -v /mnt/blockstore/dymension:/root/.dymension --name dymension dymension --home /root/.dymension
