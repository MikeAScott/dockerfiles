#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM ubuntu

ENV \
  LANG=en_GB \
  LANGUAGE=en_GB:en

# Install LXDE and VNC server.
RUN \
  locale-gen "en_GB" && \
  locale-gen "en_GB.UTF-8" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"]

# Expose ports.
EXPOSE 5901