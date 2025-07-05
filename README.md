# Monero Miner
This is just one of the easiest ways to mine monero for Linux, just execute the command below, you will get a question if you want to donate, if you press y. You will start mining for me :), if you press n, you need to set some setting to mine.

## Linux version:
#### I recommend using Debian live with no partitions or something like that, because Debian is a light version and the script is made for a live version.
It has currently a Linux support, but just run this command, this will create a folder inside the current folder and execute the mining script. Make sure to execute the following command as root user.

``` shell
# Its always good to update:
sudo apt update

# To clone the script from github to your linux computer.
curl -O https://niam3231.github.io/monero-miner/linux/start.sh

# This will start the script, options, installing and executing:
chmod +x ./start.sh && sudo ./start.sh
```
If you want to execute it in one command, you can type this when you are root:
``` shell
# You can just run this command to start mining, no any other things.
curl -O https://niam3231.github.io/monero-miner/linux/start.sh && chmod +x ./start.sh && sudo ./start.sh
```
You can also use the OpenCL version (This is still beta!):
``` shell
# Only works if you device support it:
curl -O https://niam3231.github.io/monero-miner/linux/start-opencl.sh
```
## Linux (ARM version)
If you have a Raspberry Pi or another ARM-CPU device, you can use the ARM version:
``` shell
# Updating is heavily recommed becouse there are many packages installed.
sudo apt update

# To clone the script from github to your linux computer.
curl -O https://niam3231.github.io/monero-miner/linux/start-arm.sh

# This will start the script, options, installing and executing:
chmod +x ./start-arm.sh && sudo ./start-arm.sh
```