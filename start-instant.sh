# === This script is made to begin mining on x86 or x64 devices without needing a interactive shell ===
#!/bin/bash

# You can change this to your own information.
# ==== Configuration ====
MINING_ADDRESS="gulf.moneroocean.stream:10128" # Hint - By using port 80 on moneroocean you can bypass firewall
WALLET="46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC.Cloud"
THREADS=0       # Number of CPU threads to use, 0 means using all threads
# =======================

clear
echo "Downloading xmrig..."
wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz

echo "Unpacking xmrig..."
tar -zxf xmrig-6.24.0-linux-static-x64.tar.gz
cd xmrig-6.24.0

./xmrig -a rx/0 -o $MINING_ADDRESS -u $WALLET -p x -t $THREADS
