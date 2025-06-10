#!/bin/bash
cp ../resources/rider.desktop /usr/share/applications
cp ../resources/rider.png /usr/share/icons/rider.png
distrobox-export --app "Jetbrains Rider"
