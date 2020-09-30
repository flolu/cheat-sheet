# Ubuntu

## Installs

```bash
sudo apt update && \
sudo snap install chromium --classic && \
sudo snap install code --classic && \
sudo snap install blender --classic && \
sudo snap install discord --classic && \
sudo apt install vlc ffmpegthumbnailer ffmpeg youtube-dl rawtherapee -y

# docker
sudo apt install git docker-compose -y && \
sudo gpasswd -a $USER docker && \
newgrp docker

# configure git user
git config --global user.email "flo@flolu.com" && \
git config --global user.name "flolu"

# node
sudo apt install nodejs -y && \
sudo apt install npm -y && \
mkdir ~/.npm-global && \
npm config set prefix '~/.npm-global' && \
export PATH=~/.npm-global/bin:$PATH && \
source ~/.profile && \
npm install -g yarn

# nvidia driver
ubuntu-drivers devices | grep recommended && \
sudo apt install nvidia-driver-450
```

```bash
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

# Media

## Batch compress / resize images

```bash
for i in *; do convert $i -resize 2048x $i-compressed; done;
```

## Download YouTube Playlist

```bash
youtube-dl <PLAYLIST_URL>
youtube-dl --extract-audio --audio-format wav <PLAYLIST_URL>
```

## Download Private YouTube Playlist

Download `cookies.txt` with the help of [cookies.txt](https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg)

```bash
youtube-dl --cookies=cookies.txt <URL>
```

## Download YouTube Video as Best MP4

```bash
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' <URL>
```

## Display RAW Thumbnails in File Browser

Set content of `/usr/share/thumbnailers/gdk-pixbuf-thumbnailer.thumbnailer` to

```
[Thumbnailer Entry]
TryExec=/usr/bin/gdk-pixbuf-thumbnailer
Exec=/usr/bin/gdk-pixbuf-thumbnailer -s %s %u %o
MimeType=image/png;image/bmp;image/x-bmp;image/x-MS-bmp;image/gif;image/x-icon;image/x-ico;image/x-win-bitmap;image/vnd.microsoft.icon;application/ico;image/ico;image/icon;text/ico;application/x-navi-animation;image/jpeg;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/tiff;image/x-xpixmap;image/x-xbitmap;image/x-tga;image/x-icns;image/x-quicktime;image/qtif;image/x-3fr;image/x-adobe-dng;image/x-arw;image/x-bay;image/x-canon-cr2;image/x-canon-crw;image/x-cap;image/x-cr2;image/x-crw;image/x-dcr;image/x-dcraw;image/x-dcs;image/x-dng;image/x-drf;image/x-eip;image/x-erf;image/x-fff;image/x-fuji-raf;image/x-iiq;image/x-k25;image/x-kdc;image/x-mef;image/x-minolta-mrw;image/x-mos;image/x-mrw;image/x-nef;image/x-nikon-nef;image/x-nrw;image/x-olympus-orf;image/x-orf;image/x-panasonic-raw;image/x-panasonic-raw2;image/x-pef;image/x-pentax-pef;image/x-ptx;image/x-pxn;image/x-r3d;image/x-raf;image/x-raw;image/x-rw2;image/x-rwl;image/x-rwz;image/x-samsung-srw;image/x-sigma-x3f;image/x-sony-arw;image/x-sony-sr2;image/x-sony-srf;image/x-sr2;image/x-srf;image/x-x3f;
```

then clear the cache

```bash
rm -rf ~/.cache/thumbnails/*
```

# Development

## Stop all Docker containers

```bash
docker container stop $(docker container ls -aq)
```

# Misc

## Print file tree

```bash
find | sed 's|[^/]*/|- |g'
```

## Print folder tree

```bash
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
```
