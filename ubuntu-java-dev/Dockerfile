#
# Ubuntu Java Dev Dockerfile
#
# Java Dev Environment
# Includes Open JDK 7 and Eclipse with LXDE and tightvnc
# https://github.com/mikeascott/ubuntu-java-dev
#

# Pull base image.
FROM ubuntu

ENV LANG en_GB

RUN sed -i.bak 's/sid main/sid main contrib/g' /etc/apt/sources.list && \
	apt-get update && apt-get install -y \
	bzip2 \
	ca-certificates \
	curl \
	hicolor-icon-theme \
	libasound2 \
	libdbus-glib-1-2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libcanberra-gtk-module \
	--no-install-recommends \

# Install LXDE and VNC server.
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver

# Install JDK & Eclipse
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jdk \
  	&&  curl -sSL "http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-dsl-mars-1-linux-gtk-x86_64.tar.gz&r=1" -o /tmp/eclipse.tar.gz \
	&& mkdir -p /opt/eclipse \
	&& tar -xvzf /tmp/eclipse.tar.gz -C /opt/eclipse --strip-components 1 \
	&& rm /tmp/eclipse.tar.gz* \
	&& ln -s /opt/eclipse/eclipse /usr/bin/eclipse

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Install Firefox
ENV FIREFOX_VERSION 43.0
ENV FIREFOX_LANG en-GB

RUN curl -sSL "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2" -o /tmp/firefox.tar.bz2 \
	&& mkdir -p /opt/firefox \
	&& tar -xjf /tmp/firefox.tar.bz2 -C /opt/firefox --strip-components 1 \
	&& rm /tmp/firefox.tar.bz2* \
	&& ln -s /opt/firefox/firefox /usr/bin/firefox

RUN rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data/projects

# Define default command.
CMD ["vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"]


# Expose ports.
EXPOSE 5901