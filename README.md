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
cd $env:UserProfile
mkdir monero-installer
cd monero-installer
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/windows/start.ps1 -OutFile start.ps1
./start.ps1
```
4. Now you will get instructions what to do further.

To begin with again with mining:
1. Press WIN+R
2. Type CMD and press enter.
3. Paste the following:
``` batch
wsl cd; curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/auto.sh; chmod +x ./auto.sh; ./auto.sh
```

## Linux version:
I recommend using Debian live with no partitions or something like that, because Debian is a light version and the script is made for a live version.
Just run this command, this will create a folder inside the current folder and execute the mining script. Make sure to execute the following command as root user. This is made for x86_64 devices such as desktops or laptops.

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
## Troubleshooting
If you have get this error from curl:
``` bash
curl: (6) Could not resolve host: raw.githubusercontent.com
```
There went probably something wrong with DNS, this often happens when you use cloud services. You can fix it by changing the DNS settings to 8.8.8.8 and as secondary 1.1.1.1. Those are from Google and Cloudflare.
``` shell
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" | sudo tee /etc/resolv.conf > /dev/null
```
If you don't want to use root:
``` shell
mkdir -p ~/.config/dns && echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > ~/.config/dns/resolv.conf && export RESOLV_CONF=$HOME/.config/dns/resolv.conf
```
On Windows, Android or any other distributions you can use the GUI.