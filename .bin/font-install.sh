#!/bin/sh

cd ~
mkdir tmp
curl -o ~/tmp/2.012R.zip -LO https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.zip
unzip -d ~/tmp/fonts ~/tmp/2.012R.zip
cp ~/tmp/fonts/source-han-code-jp-2.012R/OTF/* ~/Library/Fonts/
rm -rf ~/tmp