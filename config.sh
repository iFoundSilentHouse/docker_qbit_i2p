#!/bin/sh
# Set absolute path for torrents' virtual volume
# It will be safely mounted to docker and available in host
# Make sure docker user has permissions to write to it
P2P_DIR="/"
WEBUI_PORT="8080"

CONTAINER_NAME="qbit-i2p"
