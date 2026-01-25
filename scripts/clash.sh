#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path:  $ PWD"

mkdir -p files/etc/openclash/core
cd files/etc/openclash/core || { echo "Clash core path does not exist!"; exit 1; }

# Define URL without spaces or quotes around =
CLASH_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"

echo "Downloading Clash Meta Core from:  $ CLASH_URL"
wget -O clash.tar.gz " $ CLASH_URL"

# Detect file type
if file clash.tar.gz | grep -q "gzip compressed data"; then
    echo "Detected as gzip-compressed binary (not tar). Decompressing..."
    mv clash.tar.gz clash.gz
    gunzip clash.gz
    BINARY_NAME="clash-linux-amd64"
elif file clash.tar.gz | grep -q "tar archive"; then
    echo "Detected as tar.gz archive. Extracting..."
    tar -xzf clash.tar.gz
    BINARY_NAME="clash"
else
    echo "Error: Unknown format of downloaded Clash core!" >&2
    exit 1
fi

if [ ! -f " $ BINARY_NAME" ]; then
    echo "Error: Clash binary ' $ BINARY_NAME' not found after extraction!" >&2
    exit 1
fi

chmod +x " $ BINARY_NAME"

# Create compatibility symlinks or copies
cp " $ BINARY_NAME" clash_dev
cp " $ BINARY_NAME" clash_tun
cp " $ BINARY_NAME" clash_meta
cp " $ BINARY_NAME" clash

rm -f clash.tar.gz clash.gz " $ BINARY_NAME"

echo "Clash cores installed successfully:"
ls -l clash*
