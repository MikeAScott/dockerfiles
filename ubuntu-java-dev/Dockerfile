#
# Ubuntu Java Dev Dockerfile
#
# Java Dev Environment
# Includes Open JDK 7 and Eclipse with LXDE and tightvnc
# https://github.com/mikeascott/ubuntu-java-dev
#

# Pull base image.
FROM ubuntu-desktop
MAINTAINER Mike Scott <mike.scott@sqs.com>

# Install
RUN sed -i.bak 's/sid main/sid main contrib/g' /etc/apt/sources.list && \
	apt-get update && apt-get install -y -q \
	ca-certificates \
	curl \
	firefox \
	openjdk-7-jdk \
	maven \
	git \
	--no-install-recommends

# Install Eclipse
RUN \
  	curl -sSL "http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-dsl-mars-1-linux-gtk-x86_64.tar.gz&r=1" -o /tmp/eclipse.tar.gz \
	&& mkdir -p /opt/eclipse \
	&& tar -xvzf /tmp/eclipse.tar.gz -C /opt/eclipse --strip-components 1 \
	&& rm /tmp/eclipse.tar.gz* \
	&& ln -s /opt/eclipse/eclipse /usr/bin/eclipse

COPY eclipse.desktop /usr/share/applications/

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Define working directory.
WORKDIR /data/projects

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901