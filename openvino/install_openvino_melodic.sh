#!/bin/bash

echo ""
echo "[Note] Install yolo inference engine"
echo ""
echo "PRESS [ENTER] TO CONTINUE"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Extract files]"
cd
wget https://github.com/clobot0508/chameleon_dependency/releases/download/melodic/l_openvino_toolkit_p_2020.4.287.tgz
tar -xvzf l_openvino_toolkit_p_2020.4.287.tgz

echo "[Installation]"
cd l_openvino_toolkit_p_2020.4.287
sudo ./install.sh

echo "[Install dependencies]"
cd /opt/intel/openvino/install_dependencies
sudo -E ./install_openvino_dependencies.sh
sudo apt-get install libpython3.7 -y

echo ""
echo "[complete!!!!]"
