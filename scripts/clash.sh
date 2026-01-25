- name: Create clash.sh script
  run: |
    mkdir -p scripts
    cat > scripts/clash.sh << 'EOF'
#!/bin/bash
set -e

echo "Start Clash Core Download !"
echo "Current Path:  $ PWD"

mkdir -p files/etc/openclash/core
cd files/etc/openclash/core

CLASH_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"
echo "Downloading Clash Meta Core from:  $ CLASH_URL"

wget -O clash.tar.gz " $ CLASH_URL"

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
cp " $ BINARY_NAME" clash_dev clash_tun clash_meta clash
rm -f clash.tar.gz clash.gz " $ BINARY_NAME"

echo "✅ Clash cores installed successfully:"
ls -l clash*
EOF

    chmod +x scripts/clash.sh
