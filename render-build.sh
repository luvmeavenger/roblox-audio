#!/usr/bin/env bash
# exit on error
set -o errexit

# The "Silencer": Creates a fake tput command so the build doesn't crash
mkdir -p internal_bin
echo -e '#!/bin/sh\nexit 0' > internal_bin/tput
chmod +x internal_bin/tput
export PATH=$PATH:$(pwd)/internal_bin

# Standard build steps
pip install -r requirements.txt

# Download FFmpeg
mkdir -p bin
curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz | tar -xJ --strip-components=1 -C bin
