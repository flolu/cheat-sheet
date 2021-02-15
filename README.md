# Ubuntu

```bash
sudo apt update && \
sudo snap install chromium --classic && \
sudo snap install code --classic && \
sudo snap install blender --classic && \
sudo snap install discord --classic && \
sudo snap install telegram-desktop --classic && \
sudo snap install node --classic && \
sudo apt install git ffmpegthumbnailer ffmpeg youtube-dl rawtherapee terminator mpv -y

# docker
sudo apt install git docker-compose -y && \
sudo gpasswd -a $USER docker && \
newgrp docker

# configure git user
git config --global user.email "loflude@gmail.com" && \
git config --global user.name "flolu"

# yarn
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
# add export PATH=~/.npm-global/bin:$PATH to ~/.profile
source ~/.profile
npm install -g yarn

# nvidia driver
ubuntu-drivers devices | grep recommended && \
sudo apt install nvidia-driver-460
```

```bash
# xournal
sudo snap install xournalpp

# angular cli
sudo yarn global add @angular/cli --prefix /usr/local

# for reading sd card
sudo apt-get install exfat-utils exfat-fuse

# ckb-next
sudo add-apt-repository ppa:tatokis/ckb-next && \
sudo apt install ckb-next -y

# veracrypt
sudo add-apt-repository ppa:unit193/encryption && \
sudo apt update && \
sudo apt install veracrypt -y
```
