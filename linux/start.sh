clear && read -p "Do you want to continue? (y/n) " answer && [[ $answer == [Yy] ]] && clear && read -p "Press enter to start installing the program..." && wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v6.7.0/xmrig-6.7.0-linux-x64.tar.gz && clear && read -p "Press enter to start unpacking the program..." && tar -zxf xmrig-6.7.0-linux-x64.tar.gz && cd xmrig-5.5.1 && clear && read -p "Press enter to start the mining progress..." && clear && ./xmrig -a rx/0 -o gulf.moneroocean.stream:10128 -u 46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC.Linux -p x || echo "You chose no."
