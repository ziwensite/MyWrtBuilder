#!/bin/bash

# 主配置名称
PROFILE="generic"

PACKAGES=""

# Argon 主题
PACKAGES="$PACKAGES luci-theme-argon luci-i18n-argon-config-zh-cn"

# 常用系统管理组件

# Diskman 磁盘管理
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"
# CPU 占用限制
PACKAGES="$PACKAGES luci-i18n-cpulimit-zh-cn"
# collectd 统计
PACKAGES="$PACKAGES luci-i18n-statistics-zh-cn"

# 常用软件服务

# OpenClash 代理
PACKAGES="$PACKAGES luci-app-openclash"
# frp 和 nps 内网穿透
PACKAGES="$PACKAGES luci-i18n-nps-zh-cn luci-i18n-frpc-zh-cn"

# 常用的网络存储组件

# 文件助手
PACKAGES="$PACKAGES luci-app-fileassistant"
# 硬盘休眠
PACKAGES="$PACKAGES luci-i18n-hd-idle-zh-cn"
# p910nd 打印服务器
PACKAGES="$PACKAGES luci-i18n-p910nd-zh-cn"
# GoWebDav
PACKAGES="$PACKAGES luci-i18n-gowebdav-zh-cn"
# Samba 网络共享
PACKAGES="$PACKAGES luci-i18n-samba4-zh-cn"
# qBittorrent 下载器
PACKAGES="$PACKAGES luci-i18n-qbittorrent-zh-cn"
# Aria2 下载器
PACKAGES="$PACKAGES luci-i18n-aria2-zh-cn"
# FTP 服务器
PACKAGES="$PACKAGES luci-i18n-vsftpd-zh-cn"

# Docker 组件
PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn luci-i18n-docker-zh-cn"

# VPN 类
PACKAGES="$PACKAGES luci-i18n-ipsec-vpnd-zh-cn luci-i18n-zerotier-zh-cn luci-i18n-wireguard-zh-cn"

# 网络组件

# EQoS 网速控制
PACKAGES="$PACKAGES luci-i18n-eqos-zh-cn"
# 多线多拨与负载均衡
PACKAGES="$PACKAGES luci-app-syncdial luci-i18n-mwan3-zh-cn"

# 宽带监控 Nlbwmon
PACKAGES="$PACKAGES luci-i18n-nlbwmon-zh-cn"

# 界面翻译补全
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn luci-i18n-base-zh-cn luci-i18n-turboacc-zh-cn"

# Packages 文件夹下的 ipk 包
PACKAGES="$PACKAGES luci-i18n-wrtbwmon-zh-cn"

# 一些自己需要的内核组件
PACKAGES="$PACKAGES kmod-usb-printer kmod-lp"

# 一些其他可能有用的包
PACKAGES="$PACKAGES vim lrzsz zsh netdata openssh-server openssh-client"

# 一些自定义文件
FILES="files"

# 禁用 openssh-server 的 sshd 服务和 docker 的 dockerd 服务以防止冲突
DISABLED_SERVICES="sshd dockerd"

make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"