#!/bin/bash
arch=$(uname -m | awk '{if($0 ~ /arm|aarch/){print "ARM"} else if($0 ~ /x86_64|amd64/){print "AMD"} else{print "OTHER"}}')
bit=$(uname -m | awk '{if($0 ~ /64/) print "64-BIT"; else if($0 ~ /86/) print "32-BIT"; else print "OTHER"}')
termux=$([ "$PREFIX" = "/data/data/com.termux/files/usr" ] && echo "true" || echo "false")
if [ "$bit" = "64-BIT" ] && [ "$termux" = "true" ]; then
  echo ""
  echo "Your device is compatible. But Termux is not supported by XMRig."
  echo "Your system can recompile XMRig to make it work on your device."
  echo ""
  read -p "Do you want to install XMRig? (y/n): " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo ""
	echo "Copy the following:"
	echo "apt update"
	echo "apt install sudo -y"
	echo "sudo apt install curl -y"
    echo "curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start-arm.sh"
    echo "chmod +x ./start-arm.sh && sudo ./start-arm.sh"
	echo ""
	echo "Press any key if you copied the text."
	read
	pkg install proot-distro
    proot-distro install ubuntu
    echo ""
	echo "When you enter the shell, you need to paste the commands you copied."
    proot-distro login ubuntu
  else
    echo "XMRig will NOT be installed on your device."
  fi
elif [ "$bit" = "32-BIT" ] && [ "$termux" = "true" ]; then
  echo ""
  echo "Your device is NOT compatible. Because it's 32-bit, it's almost impossible to mine something."
elif [ "$arch" = "ARM" ] && [ "$bit" = "64-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is compatible. But ARM is not supported by XMRig."
  echo "Your system can recompile XMRig to make it work on your device."
  echo ""
  read -p "Do you want to install XMRig? (y/n): " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start-arm.sh
    chmod +x ./start-arm.sh && sudo ./start-arm.sh
  else
    echo "XMRig will NOT be installed on your device."
  fi
elif [ "$arch" = "ARM" ] && [ "$bit" = "32-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is NOT compatible. Because it's 32-bit, it's almost impossible to mine something."
elif [ "$arch" = "AMD" ] && [ "$bit" = "64-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is FULLY compatible. XMRig is made for your device."
  echo ""
  read -p "Do you want to install XMRig? (y/n): " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    sudo apt update
	sudo apt install curl -y
	curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start.sh
	chmod +x ./start.sh && sudo ./start.sh
  else
    echo "XMRig will NOT be installed on your device."
  fi
elif [ "$arch" = "ARM" ] && [ "$bit" = "32-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is NOT compatible. Because it's 32-bit, it's almost impossible to mine something."
elif [ "$arch" = "ARM" ] && [ "$bit" = "OTHER" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is unknown. The script cannot detect what hardware you have."
elif [ "$arch" = "AMD" ] && [ "$bit" = "OTHER" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is unknown. The script cannot detect what hardware you have."
elif [ "$arch" = "OTHER" ] && [ "$bit" = "64-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is unknown. The script cannot detect what hardware you have."
elif [ "$arch" = "OTHER" ] && [ "$bit" = "32-BIT" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is unknown. The script cannot detect what hardware you have."
elif [ "$arch" = "OTHER" ] && [ "$bit" = "OTHER" ] && [ "$termux" = "false" ]; then
  echo ""
  echo "Your device is unknown. The script cannot detect what hardware you have."
else
  echo "Your device is unknown, or the script encountered an error. The script cannot detect what hardware you have."
fi
