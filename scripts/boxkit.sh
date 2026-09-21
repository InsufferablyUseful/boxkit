#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

#Add testing repository
echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update the container and install packages
apk update && apk upgrade

grep -v '^#' ./boxkit.packages | xargs apk add
#Install bitwarden-cli
npm install -g @bitwarden/cli
#Install visidata
pipx install --global visidata
#Install yt-x
curl -sL "https://github.com/Benexl/yt-x/releases/download/v0.8.6/yt-x" -o /bin/yt-x
chmod +x /bin/yt-x

