#!/bin/bash

docker run -it --rm -p 5901:5901 -e USER=root \
    -v $PWD/data:/data \
    debian-desktop \
    bash -c "vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"
