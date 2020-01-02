# Cheat Sheet

## Media

### Download YouTube Playlist

```
youtube-dl <PLAYLIST_URL>
youtube-dl --extract-audio --audio-format wav <PLAYLIST_URL>
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
