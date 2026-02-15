#!/usr/bin/env bash
# exit on error
set -o errexit

# Disable terminal colors to stop the tput error
export TERM=dumb

echo "Building dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Installing FFmpeg..."
mkdir -p bin
curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz | tar -xJ --strip-components=1 -C bin
chmod +x bin/ffmpeg

echo "Build complete!"
