#!/bin/sh
rm -r ./config/*
rm -r ./share/*
docker cp qbit-i2p:/home/qbit/.config/qBittorrent ./config
docker cp qbit-i2p:/home/qbit/.local/share ./local
chmod +w ./config
chmod +w ./local
