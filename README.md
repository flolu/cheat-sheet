# Cheat Sheet

## Media

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

## Development

### Clear Docker Resources

```
docker system prune
docker system prune --volumes
```

### Stop all Docker containers

```
docker container stop $(docker container ls -aq)
```
