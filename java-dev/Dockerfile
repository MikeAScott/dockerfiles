# https://github.com/mikeascott/ubuntu-java-dev
#

# Pull base image.
FROM mikeascott/debian-desktop
MAINTAINER Mike Scott <mike.scott@sqs.com>

RUN apt-get update && \
    apt-get install -y \
    curl \
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

RUN \
    adduser --disabled-password --gecos "Developer" developer --ingroup users \
    && adduser developer sudo \
    && echo "developer:developer" | chpasswd

RUN \
  mkdir -p /data/projects \
  && chown -R developer:users /data/projects

WORKDIR /data/projects

COPY init-user.sh /root/

RUN \
    chmod +x /root/init-user.sh

ENTRYPOINT ["/root/init-user.sh", "developer"]

CMD tail -f /home/developer/.vnc/*.log
