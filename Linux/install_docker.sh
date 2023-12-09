#!/bin/bash

# 更新系统包
sudo apt update

# 安装必要的包
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 的官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# 添加 Docker 仓库到 APT 源
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# 更新 APT 包索引
sudo apt update

# 安装 Docker CE
sudo apt install -y docker-ce

# 安装 Docker Compose 版本 2.23.3
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 显示 Docker 和 Docker Compose 的版本
docker version
docker-compose version
