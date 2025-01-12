#!/bin/sh
. ./config.sh

if [ "${P2P_DIR}" = "/" ]; then
  echo "# Please set your torrents folder at the config.sh"
  exit 1
else
  echo "# Folder to mount: ${P2P_DIR}"
fi

if [ "$(docker ps -a | grep ${CONTAINER_NAME})" ]; then
	echo "# Removing old container"
	docker kill ${CONTAINER_NAME}
 	docker rm ${CONTAINER_NAME}
fi

docker run --name=${CONTAINER_NAME} \
	-it \
	--expose ${WEBUI_PORT} -p ${WEBUI_PORT}:${WEBUI_PORT} \
	-v ${P2P_DIR}:/home/qbit/Torrents \
	--restart=always \
	${CONTAINER_NAME} sh -c "i2pd </dev/null &>/dev/null & qbittorrent-nox --webui-port=${WEBUI_PORT}"
