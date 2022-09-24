#!/bin/sh

# source-han-code-jp
mkdir ./tmp
wget -O ./tmp/2.012R.zip https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.zip
unzip -d ./tmp/fonts ./tmp/2.012R.zip
cp ./tmp/fonts/source-han-code-jp-2.012R/OTF/* ~/Library/Fonts/

# MesloLGS
wget -O ./tmp/MesloLGS-NF-Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O ./tmp/MesloLGS-NF-Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O ./tmp/MesloLGS-NF-Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O ./tmp/MesloLGS-NF-Bold-Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
cp ./tmp/*.ttf ~/Library/Fonts/

rm -rf ./tmp