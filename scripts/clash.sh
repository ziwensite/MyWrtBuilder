#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path:  $ PWD"

mkdir -p files/etc/openclash/core
cd files/etc/openclash/core || { echo "Clash core path does not exist!"; exit 1; }

# ==============================
# 注意：dev 和 premium 已不可用，跳过下载
# 用 Meta 内核同时充当 clash_dev、clash_tun、clash_meta（实际都是同一个）
# ==============================

CLASH_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"
echo "Downloading Clash Meta Core from:  $ CLASH_URL"
wget -O clash.tar.gz " $ CLASH_URL"

# 判断是否为真正的 tar 包（目前实际是 gzip 压缩的单文件）
if file clash.tar.gz | grep -q "gzip compressed data"; then
    echo "Detected as gzip-compressed binary (not tar). Decompressing..."
    mv clash.tar.gz clash.gz
    gunzip clash.gz
    BINARY_NAME="clash-linux-amd64"
elif file clash.tar.gz | grep -q "tar archive"; then
    echo "Detected as tar.gz archive. Extracting..."
    tar -xzf clash.tar.gz
    BINARY_NAME="clash"  # 假设 tar 中文件名为 clash
else
    echo "Error: Unknown format of downloaded Clash core!" >&2
    exit 1
fi

# 确保二进制存在
if [ ! -f " $ BINARY_NAME" ]; then
    echo "Error: Clash binary ' $ BINARY_NAME' not found after extraction!" >&2
    exit 1
fi

# 赋予执行权限
chmod +x " $ BINARY_NAME"

# 复制为多个名字以兼容旧逻辑
cp " $ BINARY_NAME" clash_dev
cp " $ BINARY_NAME" clash_tun
cp " $ BINARY_NAME" clash_meta
cp " $ BINARY_NAME" clash  # 默认核心

# 清理临时文件
rm -f clash.tar.gz clash.gz " $ BINARY_NAME"

echo "Clash cores installed successfully:"
ls -l clash*
