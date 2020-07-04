# 🐧 Ubuntu

## Essential installs
```
sudo apt purge snapd && \
sudo apt install snapd
```

```bash
sudo apt update && \
sudo apt install curl git gcc nodejs python docker-compose -y && \
sudo snap install chromium --classic && \
sudo snap install code --classic && \

# configure docker
# sudo groupadd docker && \
sudo gpasswd -a $USER docker && \
newgrp docker && \

# configure git user
git config --global user.email "flo@flolu.com" && \
git config --global user.name "flolu" && \

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y && \

# bazel
sudo yarn global add @bazel/buildifier --prefix /usr/local && \
sudo yarn global add @bazel/bazelisk --prefix /usr/local && \

# nvidia driver
ubuntu-drivers devices | grep recommended && \
sudo apt install nvidia-driver-440
```

## Secondary installs

```bash
sudo apt install git vlc curl ffmpegthumbnailer ffmpeg youtube-dl rawtherapee python python3-pip gnome-tweak-tool -y && \
sudo snap install kubectl --classic && \
sudo snap install helm --classic && \
sudo snap install discord --classic && \

# angular cli
sudo yarn global add @angular/cli --prefix /usr/local

# for reading sd card
sudo apt-get install exfat-utils exfat-fuse

# gcloud https://cloud.google.com/sdk/docs/downloads-apt-get
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
sudo apt-get install apt-transport-https ca-certificates gnupg && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
sudo apt-get update && sudo apt-get install google-cloud-sdk -y && \
gcloud init

sudo snap install obs-studio --classic && \
sudo snap install blender --classic && \

# ckb-next
sudo add-apt-repository ppa:tatokis/ckb-next && \
sudo apt install ckb-next -y && \

# veracrypt
sudo add-apt-repository ppa:unit193/encryption && \
sudo apt update && \
sudo apt install veracrypt -y && \

# brave browser
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt install brave-browser

# swipe gestures
sudo apt-get install git libinput-tools libxdo-dev g++ && \
git clone https://github.com/Hikari9/comfortable-swipe.git --depth 1 && \
cd comfortable-swipe && \
bash install && \
cd .. && rm -rf comfortable-swipe && \
sudo gpasswd -a $USER $(ls -l /dev/input/event* | awk '{print $4}' | head --line=1) && \
sudo reboot

comfortable-swipe autostart

# latex
sudo apt install texlive-latex-extra
```

## Customization

```
# two monitor setup
xrandr --output DVI-I-0 --mode 1920x1080 --pos 0x550 --rotate left --output HDMI-0 --primary --mode 3440x1440 --rate 99.98 --pos 1080x0
```

# 🖼️ Media

## Convert mp4 to gif

```bash
ffmpeg -t 3 -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
```

- -t 3 (3 seconds in length)

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

# 👨‍💻️ Development

## Clear Docker Resources

```bash
docker system prune
docker system prune --volumes
```

## Stop all Docker containers

```bash
docker container stop $(docker container ls -aq)
```

# 🤪 Misc

## Print file tree

```bash
find | sed 's|[^/]*/|- |g'
```

## Print folder tree

```bash
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
```
