# Monero Miner
This is just one of the easiest ways to mine Monero for Linux, just execute the command below, you will get a question if you want to donate, if you press y. You will start mining for me :), if you press n, you need to set some setting to mine.

## Auto version:
The auto version works only for Linux, it checks if your system is compatible and tells you. On request, it also installs XMRig for you.

To install, run these commands:
``` shell
# To clone the script from github to your linux computer.
curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/auto.sh

# This will start the script, install XMRig for you hardware:
chmod +x ./auto.sh && ./auto.sh
```
## Windows
1. Press WIN+R to open execute window.
2. Then type PowerShell and press CTRL+SHIFT+ENTER to run it as admin.
3. Paste the following:
``` powershell
cd $env:UserProfile && mkdir monero-installer && cd monero-installer && Invoke-WebRequest -Uri https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/windows/start.ps1 -OutFile start.ps1 && ./start.ps1
```
4. Now you will get instructions what to do further.

## Linux version:
I recommend using Debian live with no partitions or something like that, because Debian is a light version and the script is made for a live version.
It has currently a Linux support, but just run this command, this will create a folder inside the current folder and execute the mining script. Make sure to execute the following command as root user. This is made for AMD devices such as desktops or laptops.

``` shell
# Its always good to update:
sudo apt update

# To clone the script from github to your linux computer.
curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start.sh

# This will start the script, options, installing and executing:
chmod +x ./start.sh && sudo ./start.sh
```
You can also use the OpenCL version:

_Note: This is in highly beta and will likely not work or output many errors if your system is not compatible or OpenCL is not right installed._
``` shell
# Its always good to update:
sudo apt update

# To clone the script from github to your linux computer.
curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start-opencl.sh

# This will start the script, options, installing and executing:
chmod +x ./start-opencl.sh && sudo ./start-opencl.sh
```
## Linux (ARM version)
If you have a Raspberry Pi or another ARM-CPU device, you can use the ARM version:

_Note: It's likely not profitable because of the hardware._
``` shell
# Updating is heavily recommed becouse there are many packages installed.
sudo apt update

# To clone the script from github to your linux computer.
curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start-arm.sh

# This will start the script, options, installing and executing:
chmod +x ./start-arm.sh && sudo ./start-arm.sh
```
## Linux (Termux-ARM version)
If you have an android phone, you can clone this script to start mining on android.

_Note: You will need to have at least 3GB free, it will install a proot-distro. Also, it's likely not profitable because of the hardware._
First, install proot to gain (fake) root access and correct libraries.
``` shell
pkg install proot-distro
proot-distro install ubuntu
proot-distro login ubuntu
```
Now inside Ubuntu, run these commands.
``` shell
apt update
apt install sudo -y
sudo apt install curl -y
curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/start-arm.sh
chmod +x ./start-arm.sh && sudo ./start-arm.sh
```
