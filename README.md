# Cheat Sheet

## 🐧 Ubuntu

### Setup after clean install

```
sudo apt update
sudo apt install git nodejs npm vlc ffmpegthumbnailer ffmpeg youtube-dl gnome-tweaks rawtherapee docker-compose python python3-pip
sudo snap install chromium kubectl blender code --classic

# configure docker
sudo groupadd docker
sudo usermod -aG docker $USER
# then log out and back in

# for reading sd card
sudo apt-get install exfat-utils exfat-fuse

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install yarn

# ckb-next
sudo add-apt-repository ppa:tatokis/ckb-next
sudo apt install ckb-next

# nvidia driver
ubuntu-drivers devices | grep recommended
sudo apt install nvidia-driver-435

# configure git user
git config --global user.email "fllu@pm.me"
git config --global user.name "flolu"

# veracrypt
sudo add-apt-repository ppa:unit193/encryption
sudo apt update
sudo apt install veracrypt

# obs
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install obs-studio
```

### Fix mouse issues

Create file `/etc/X11/xorg.conf.d/50-vmmouse.conf` with content:

```
Section "InputClass"
 Identifier "Mouse Remap"
 MatchProduct "Madcatz Mad Catz R.A.T.3 Mouse"
 MatchDevicePath "/dev/input/event*"
 Option "ButtonMapping" "1 2 3 4 5 6 7 8 9 0 0 0 13 14 15 16 17 18"
EndSection
```

## 🖼️ Media

### Convert mp4 to gif

```
ffmpeg -t 3 -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
```

- -t 3 (3 seconds in length)

### Batch compress / resize images

```
for i in *; do convert $i -resize 2048x $i-compressed; done;
```

### Download YouTube Playlist

```
youtube-dl <PLAYLIST_URL>
youtube-dl --extract-audio --audio-format wav <PLAYLIST_URL>
```

### Download Private YouTube Playlist

Download `cookies.txt` with the help of [cookies.txt](https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg)

```
youtube-dl --cookies=cookies.txt <URL>
```

### Download YouTube Video as Best MP4

```
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' <URL>
```

## 👨‍💻️ Development

### Clear Docker Resources

```
docker system prune
docker system prune --volumes
```

### Stop all Docker containers

```
docker container stop $(docker container ls -aq)
```

## 🤪 Misc

### Print file tree

```
find | sed 's|[^/]*/|- |g'
```

### Print folder tree

```
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
```
