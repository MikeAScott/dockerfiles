#!/bin/bash

USER="$1"

echo "Setting up user $USER"
if [ ! -e /home/$USER/.bashrc ] ;
then
  mkdir -p /home/$USER
  cp /etc/skel/.* /home/$USER/;
  chown -R $USER:users /home/$USER/;
fi

su -c "echo -e '$USER\n$USER' | vncpasswd" $USER

su -c "vncserver :1 -geometry 1280x800 -depth 24" $USER


shift
exec "$@"
