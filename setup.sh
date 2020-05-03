#!/bin/bash
while true; do
    read -p "Do you want to install youtube-dl?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
	read -p "Do you want to install ffmpeg?" yn
    case $yn in
        [Yy]* ) ffmpeg='1'; break;;
        [Nn]* ) ffmpeg='0'; break;;
        * ) echo "Please answer yes or no.";;
    esac
done
apt update
apt install -y python
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl
if [[ $ffmpeg = 1 ]]
then
	echo
	echo "Installing ffmpeg"
	echo
	apt install -y ffmpeg
else
	echo
	echo "ffmpeg is not installed"
	echo
fi
