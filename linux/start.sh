#!/bin/bash
set -e

clear
read -p "Press enter to start installing the program..."

wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz

clear
read -p "Press enter to start unpacking the program..."

tar -zxf xmrig-6.24.0-linux-static-x64.tar.gz
cd xmrig-6.24.0

clear
read -p "Are you on a restricted network? (y/n): " restricted

# defaults
PORT=10128

if [[ $restricted == [yY] ]]; then
    PORT=80
    RESTRICT_SUFFIX="+128000"
else
    RESTRICT_SUFFIX=""
fi

clear
read -p "Do you want to donate to me? (y/n): " donate

if [[ $donate == [yY] ]]; then
    echo "Thank you so much!"
    read -p "Press enter to continue..."

    DONATE_WALLET="46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC.Linux"
    DONATE_WALLET="${DONATE_WALLET}${RESTRICT_SUFFIX}"

    ./xmrig -a rx/0 \
        -o gulf.moneroocean.stream:${PORT} \
        -u "$DONATE_WALLET" \
        -p x

    exit
fi

echo "There will be 2 questions so you can begin to mine..."

read -p "Whats the pool address (host only): " host
read -p "What is your wallet address? wallet.name " wallet

wallet="${wallet}${RESTRICT_SUFFIX}"

./xmrig -a rx/0 \
    -o ${host}:${PORT} \
    -u "$wallet" \
    -p x
