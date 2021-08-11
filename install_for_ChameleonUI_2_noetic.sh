# !/bin/bash
# Apache License 2.0
# Copyright (c) 2017, ROBOTIS CO., LTD.

echo ""
echo "Install_for_ChameleonUI_2 for ROS NOETIC"
echo ""
echo ""
echo ""
echo "[Note] CHECK nvm and redis-cli before Install_for_ChameleonUI_2"

export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm 
keyword_alias=`command -v nvm`
if [ -n "$keyword_alias" ]; then	
	echo "nvm 설치 되어있음!!!"
else
	echo "install_for_ChameleonUI_1_noetic.sh를 실행시켜 nvm 설치 해주세요!!!"
	echo "[The Second Installation Incompleted!!!]"
	exit 0
fi

keyword_alias=`command -v redis-cli`
if [ -n "$keyword_alias" ]; then	
	echo "redis-cli 설치 되어있음!!!"
else
	echo "install_for_ChameleonUI_1_noetic.sh를 실행시켜 redis-cli 설치 해주세요!!!"
	echo "[The Second Installation Incompleted!!!]"
	exit 0
fi

echo ""
echo "[Note] Installl pm2, Set auto-installation of pm2"
echo ""
echo "[Note] READY to Install???"
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm 
nvm install v12
node_version=`node --version`
npm --version

echo ""
echo ""
echo "[Check pm2]"
keyword_alias=`command -v pm2`
if [ -n "$keyword_alias" ]; then
	echo "pm2 설치 되어있음!!!"
	echo ""
else
	echo "pm2 설치 안되어있음!!! pm2 설치 시작!!!"
	echo ""
	echo ""
	echo "[Install pm2]"
	npm install pm2 -g
	cd ~/chameleonUI/bin/chameleon_ui_backend
	npm install

	echo ""
	echo ""
	echo "[Set auto-installation of pm2]"
	pm2 startup
	sudo env PATH=$PATH:/home/$USER/.nvm/versions/node/$node_version/bin /home/$USER/.nvm/versions/node/$node_version/lib/node_modules/pm2/bin/pm2 startup systemd -u $USER --hp /home/$USER
fi

echo ""
echo ""
echo "[Check pm2 version]"
keyword_alias=`pm2 save | grep "Local"`
if [ -n "$keyword_alias" ]; then
	echo "PM2 update 필요 !!!!"
	pm2 update
else
	echo "PM2 save 완료!!!!"
fi

echo ""
echo ""
echo "[Install python 3.0]"
echo "[Install other dependencies]"
sudo apt-get install python-pip -y 
sudo python3 -m pip install -U pip
sudo python3 -m pip install redis

sudo apt-get install ros-noetic-pointcloud-to-laserscan ros-noetic-rospy-message-converter -y
sudo apt install ros-noetic-gmapping -y
sudo apt install ros-noetic-map-server -y
sudo apt-get install imagemagick

echo "[The Second Installation Completed!!!]"

# exit 0