#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting build process..."

# 1. Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# 2. Setup FFmpeg
echo "Downloading FFmpeg..."
mkdir -p bin
curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz | tar -xJ --strip-components=1 -C bin

# 3. Make sure the bin folder is usable
chmod +x bin/ffmpeg

echo "Build complete!"
