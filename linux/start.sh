#!/bin/bash
set -e
clear && \
read -p "Press enter to start installing the program..." && \
wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz && \
clear && \
read -p "Press enter to start unpacking the program..." && \
tar -zxf xmrig-6.24.0-linux-static-x64.tar.gz && \
cd xmrig-6.24.0 && \
clear && \
read -p "Do you want to donate to me? (y/n): " answer && \
[[ $answer == [yY] ]] && \
echo "Thank you so much!" && \
read -p "Press enter to continue..." && \
clear && \
./xmrig -a rx/0 -o gulf.moneroocean.stream:10128 -u 46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC.Linux -p x && exit || echo "There will be 2 questions so you can begin to mine..." && \
read -p "Whats the address you want to mine on? address:port " address && \
read -p "What is you wallet address? wallet.name " wallet && \
./xmrig -a rx/0 -o $address -u $wallet -p x
