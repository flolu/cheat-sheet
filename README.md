# 🐧 Ubuntu

## Essential installs

```bash
sudo apt update && \
sudo apt install curl git gcc nodejs python docker-compose -y && \
sudo snap install chromium --classic && \
sudo snap install code --classic

# configure docker
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
sudo chmod 777 /var/run/docker.sock

# configure git user
git config --global user.email "fllu@pm.me" && \
git config --global user.name "flolu"

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

# bazel
sudo yarn global add @bazel/buildifier --prefix /usr/local && \
sudo yarn global add @bazel/bazelisk --prefix /usr/local

# nvidia driver
ubuntu-drivers devices | grep recommended
sudo apt install nvidia-driver-440
```

## Secondary installs

```bash
sudo apt install git vlc curl ffmpegthumbnailer ffmpeg youtube-dl rawtherapee python python3-pip -y && \
sudo snap install kubectl --classic && \
sudo snap install helm --classic && \
sudo snap install discord --classic

# angular cli
sudo yarn global add @angular/cli --prefix /usr/local

# for reading sd card
sudo apt-get install exfat-utils exfat-fuse

# gcloud
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
gcloud auth configure-docker

snap install obs-studio --classic
sudo snap install blender --classic

# ckb-next
sudo add-apt-repository ppa:tatokis/ckb-next
sudo apt install ckb-next

# veracrypt
sudo add-apt-repository ppa:unit193/encryption
sudo apt update
sudo apt install veracrypt

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
