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
#Install Jetbrains Rider
wget https://download.jetbrains.com/rider/JetBrains.Rider-2025.1.tar.gz -O /opt/rider.tar.gz
tar -xf /opt/rider.tar.gz -C /opt
rm /opt/rider.tar.gz
mv /opt/*JetBrains\ Rider-* /opt/Rider
