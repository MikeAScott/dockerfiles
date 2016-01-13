#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/mikeascott/ubuntu-desktop
#

# Pull base image.
FROM ubuntu
MAINTAINER Mike Scott <mike.scott@sqs.com>

ENV \
  USER=root \
  LANG=en_GB \
  LANGUAGE=en_GB:en

# Install LXDE and VNC server.
RUN \
  locale-gen "en_GB" && \
  locale-gen "en_GB.UTF-8" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal lxappearance tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901