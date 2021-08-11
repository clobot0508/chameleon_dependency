# !/bin/bash
# Apache License 2.0
# Copyright (c) 2017, ROBOTIS CO., LTD.

echo ""
echo ""
echo "Install_for_ChameleonUI_2 for ROS NOETIC"
echo ""
echo ""
echo ""
echo "[Note] Installl redis-server, nvm"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

sudo apt-get install redis-server -y

echo ""
echo ""
echo "[Install redis-server]"
redis-server --version
sudo bash -c "echo \"maxmemory 1gb\" >> /etc/redis/redis.conf"
sudo bash -c "echo \"maxmemory-policy allkeys-lru\" >> /etc/redis/redis.conf"

sudo systemctl restart redis-server.service
sudo systemctl enable redis-server.service
echo "type 'redis-cli' to check if redis-server is fully installed!"

echo ""
echo ""
echo "[Install nvm]"
sudo apt install curl
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

echo "[The First Installation Completed!!!]"
echo "[Please start the Second Installation!!!]"

# exit 0