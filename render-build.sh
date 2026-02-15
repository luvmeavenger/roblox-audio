#!/usr/bin/env bash
# exit on error
set -o errexit

# Create a fake tput so Render's internal script stops crashing
mkdir -p internal_bin
echo -e '#!/bin/sh\nexit 0' > internal_bin/tput
chmod +x internal_bin/tput

# Temporarily add our fake tput to the path for the build
export PATH=$(pwd)/internal_bin:$PATH

echo "--- Starting Real Build ---"

pip install --upgrade pip
pip install -r requirements.txt

# Download FFmpeg
mkdir -p bin
curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz | tar -xJ --strip-components=1 -C bin
chmod +x bin/ffmpeg

echo "--- Build Finished Successfully ---"
