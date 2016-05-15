# Logstalgia in a Docker container

This is [Logstalgia](http://logstalgia.io) (a website traffic visualization tool) installed in a Docker container.

## How to use it

Suppose your current directory contains file 'access.log' and you want to visualize it.  Then run:

```
docker run --rm -it --net host -v "$HOME/.Xauthority:/root/.Xauthority:rw" -v $(pwd):/logs --env=DISPLAY gtrafimenkov/logstalgia logstalgia /logs/access.log
```

You can replace `$(pwd)` with the path to the directory with the logs and replace `access.log` with the name of the file you want to visualize.

You can also save video to a file by piping raw video output to a video encoder, like this:

```
docker run --rm -it --net host -v "$HOME/.Xauthority:/root/.Xauthority:rw" -v $(pwd):/logs --env=DISPLAY gtrafimenkov/logstalgia /bin/bash -c 'logstalgia --output-ppm-stream - /logs/access.log | avconv -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 /logs/logstalgia.mp4'
```
