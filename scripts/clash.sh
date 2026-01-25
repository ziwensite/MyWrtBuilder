#!/bin/bash

set -e  # 遇错立即退出

echo "Start Clash Core Download !"
echo "Current Path:  $ PWD"

# 创建目标目录并进入
mkdir -p files/etc/openclash/core
cd files/etc/openclash/core

# 定义 Meta 内核下载地址（英文、无空格、紧贴等号）
CLASH_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"

echo "Downloading Clash Meta Core from:  $ CLASH_URL"

# 下载
wget -O clash.tar.gz " $ CLASH_URL"

# 判断压缩格式
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

# 检查二进制是否存在
if [ ! -f " $ BINARY_NAME" ]; then
    echo "Error: Expected binary ' $ BINARY_NAME' not found!" >&2
    exit 1
fi

# 赋予执行权限
chmod +x " $ BINARY_NAME"

# 复制为多个兼容名称
cp " $ BINARY_NAME" clash_dev
cp " $ BINARY_NAME" clash_tun
cp " $ BINARY_NAME" clash_meta
cp " $ BINARY_NAME" clash  # 默认核心

# 清理临时文件
rm -f clash.tar.gz clash.gz " $ BINARY_NAME"

echo "✅ Clash cores installed successfully:"
ls -l clash*
