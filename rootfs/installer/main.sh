#!/bin/bash

## Honeygain
mkdir -p /opt/honeygain 
curl -L https://github.com/chashtag/PiCash/releases/download/bin/honeygain.tar.gz | tar -C /opt/honeygain -zxf -
if [[ `uname -m` != "x86_64" ]]
then 
    mkdir -p /etc/qemu-binfmt/x86_64/lib64/ 
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/ld64.tar.gz | tar -C /etc/qemu-binfmt/x86_64/lib64/ -zxf -
fi



# Pawns.app (IPRoyal)
curl -L https://download.iproyal.com/pawns-cli/latest/linux_`uname -m`/pawns-cli > /usr/bin/pawns-cli
chmod +x /usr/bin/pawns-cli



# Packetstream
#mkdir -p /opt/packetstream
#curl -L https://github.com/chashtag/PiCash/releases/download/bin/packetstream.tar.gz | tar -C /opt/packetstream/ -zxf -


# Peer2Profit
if [[ `uname -m` != "x86_64" ]]
then 
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/p2pclient_0.63_arm64.deb > /tmp/p2p.deb
else
    curl -L https://updates.peer2profit.app/peer2profit_0.48_amd64.deb > /tmp/p2p.deb
fi

dpkg -x /tmp/p2p.deb /
rm -rf /tmp/p2p.deb


# Traffmonetizer
mkdir -p /opt/traffmonetizer
if [[ `uname -m` == "armv7l" ]]
then 
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/traffmonetizer-arm7.tar.gz| tar -C /opt/traffmonetizer -zxf -
else
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/traffmonetizer.tar.gz | tar -C /opt/traffmonetizer -zxf -
fi



# BitPing
wget https://downloads.bitping.com/node/armv7.zip && unzip armv7.zip -d /opt/bitping && rm -rf armv7.zip
wget https://downloads.bitping.com/node/linux.zip && unzip linux.zip -d /opt/bitping && rm -rf linux.zip





#logging
mkdir /var/log/picash
chmod 777 /var/log/picash