echo "Press any key to continue..."
read -n 1 -s
echo ""
echo "(1/5) Installing required packages..."
sudo apt update > /dev/null 2>&1
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
echo "Done"
echo ""
echo "(2/5) Installing xmrig source code..."
git clone https://github.com/xmrig/xmrig.git > /dev/null 2>&1
cd xmrig > /dev/null 2>&1
echo "Done"
echo ""
echo "(3/5) Creating build directory..."
mkdir build > /dev/null 2>&1
cd build > /dev/null 2>&1
echo "Done"
echo ""
echo "(4/5) Setting op for your device (cmake)..."
cmake .. > /dev/null 2>&1
echo "Done"
echo ""
echo "(5/5) Compile with make..."
echo "This could take a long time!"
echo "Press any key to continue..."
read -n 1 -s
echo ""
make -j$(nproc)
read -p "Do you want to donate to me? (y/n): " answer && [[ $answer == [yY] ]] && echo "Thank you so much!" && read -p "Press enter to continue..." && clear && ./xmrig -a rx/0 -o gulf.moneroocean.stream:10128 -u 46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC.Linux -p x --donate-level 0 || echo "There will be 2 questions so you can begin to mine..." && read -p "Whats the adress you want to mine on? adress:ip " adress && read -p "What is you wallet adress? " wallet && ./xmrig -a rx/0 -o $adress -u $wallet -p x