##### Monero Miner

This is my own monero miner script, if you also want to use this, just change the settings to your own. You can also just run it and donate.
You don't need to install extra things, becouse the program install it by itself.

### Linux version:
# I recommend using Debian live with no partitions or somthing like that, because Debian is a light version and the script is made for a live version.
It has currently a linux support, but just run this command, is will create a folder inside de current folder and a execute file where you execute it:

# If you don't have wget, but I still recommend executing this command.
apt install wget

# To clone the script from github to your linux computer.
# The "--no-check-certificate" is because somtimes some devices could have problems with installing files with wget.
wget niam3231.github.io/monero-miner/linux/start.sh --no-check-certificate

# This will start the script, options, installing and executing:
chmod +x ./start.sh && sudo ./start.sh
