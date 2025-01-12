# qBittorrent in docker with i2p access
Seed i2p torrents safely for your host files with this docker configuration.

Used system: [alpine](https://alpinelinux.org/) + [i2pd](https://i2pd.website/) + [qbittorrent](https://www.qbittorrent.org/). ***Only 76.3MB***.

You can even seed both i2p and clearnet torrents.
P.S. if you worry about theoretical possibility of compromising your ip, don't do that. Then you can use separate docker containers for i2p and clearnet torrents.

## Usage
1. set directory that will be mounted in docker isolated from other host files: `P2P_DIR` in config.sh
    1. (optional) set port for qbittorrent webui. `WEBUI_PORT` in config.sh. Default is 8080
2. `docker build -t qbit_i2p .`
3. `./run.sh`
4. Access 127.0.0.1:`WEBUI_PORT`. Use password generated by qbittorrent and change it on first session
5. Close terminal (without Ctrl+c)

Now your container will work all the time docker daemon works.

## Access qBittorrent settings
To get all your torrents status and configuration from existing container: `./cp_settings.sh`

* Warning: this will delete everything in [./config](./config/) and [./local](./local/) and place your config files

Or copy them manually to config and local folders.

To reset to basic settings (just i2p; no torrents) run `git checkout -- ./config && git checkout -- ./local`

##Rebuild
If you need to use another `P2P_DIR`, `WEBUI_PORT` or use torrents from local folder you have to rebuild docker container with new config:
1. `docker build -t qbit_i2p .`
2. `./run.sh`