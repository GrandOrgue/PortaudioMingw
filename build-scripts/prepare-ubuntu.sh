#!/bin/bash

set -e

sudo apt-get update
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y debhelper g++-mingw-w64 cmake wget file mc build-essential dh-make
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip devscripts debhelper g++-mingw-w64 cmake

# download and install ASIO sdk
if [ ! -d /usr/local/asio-sdk ]; then
	DL_DIR=`mktemp -d -t asio.XXX`
	wget -O $DL_DIR/asiosdk.zip https://www.steinberg.net/asiosdk
	sudo unzip -o $DL_DIR/asiosdk.zip -d /usr/local/
	rm -rf $DL_DIR
	SDK_DIR=`ls -1d /usr/local/asiosdk* | tail -1`
	sudo ln -sf `basename $SDK_DIR` /usr/local/asio-sdk
fi

