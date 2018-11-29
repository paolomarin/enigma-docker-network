#!/bin/bash
export CONTRACT_IP=`/sbin/ifconfig eth0 | awk '/inet / {gsub("(addr:)?", "", $2); print $2}'`
echo "My IP address is " $CONTRACT_IP
sed -i'' -e ':a;N;$!ba;' -e "s/ganache: {[^}]*}/ganache: { host: \"$CONTRACT_IP\", port: 8545, network_id: \"*\"}/" ~/enigma-contract/truffle.js
cd ~/enigma-contract && ganache-cli -h $CONTRACT_IP
