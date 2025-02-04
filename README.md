# Monero Miner

This is my own monero miner script, if you also want to use this, just change the settings to your own. You can also just run it and donate.
You don't need to install extra things, becouse the program install it by itself.

## Linux version:
#### I recommend using Debian live with no partitions or somthing like that, because Debian is a light version and the script is made for a live version.
It has currently a linux support, but just run this command, is will create a folder inside de current folder and execute the mining script. Make sure to execute the following command as root user.

``` shell
# Its always good to update:
sudo apt update && sudo apt upgrade -y

# To clone the script from github to your linux computer.
curl -O https://niam3231.github.io/monero-miner/linux/start.sh

# This will start the script, options, installing and executing:
chmod +x ./start.sh && sudo ./start.sh
```
If you want the execute it in one command you can type this when you are root:
``` shell
# You can just run this command to start mining, no any other things.
curl -O https://niam3231.github.io/monero-miner/linux/start.sh && chmod +x ./start.sh && sudo ./start.sh
```
