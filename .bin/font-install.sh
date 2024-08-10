#!/bin/sh

# source-han-code-jp
mkdir ./tmp
wget -O ./tmp/2.012R.zip https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.zip
unzip -d ./tmp/fonts ./tmp/2.012R.zip
cp ./tmp/fonts/source-han-code-jp-2.012R/OTF/* ~/Library/Fonts/

# UDEVGothic
wget -O ./tmp/UDEVGothic_NF.zip https://github.com/yuru7/udev-gothic/releases/download/v1.3.1/UDEVGothic_NF_v1.3.1.zip
unzip -d ./tmp/fonts ./tmp/UDEVGothic_NF.zip
cp ./tmp/fonts/UDEVGothic_NF_v1.3.1/UDEVGothicNF-*.ttf ~/Library/Fonts/
cp ./tmp/fonts/UDEVGothic_NF_v1.3.1/UDEVGothic35NF-*.ttf ~/Library/Fonts/

rm -rf ./tmp
