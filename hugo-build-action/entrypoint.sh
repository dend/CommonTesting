#!/bin/bash -l

apt-get update
apt-get install -y wget git

wget https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_0.53_Linux-64bit.deb

yes | dpkg -i hugo*.deb

hugo version

# Make sure we have the latest theme.
git clone --progress --verbose https://github.com/taikii/whiteplain .testblog/themes/whiteplain

cd .testblog
hugo -v
