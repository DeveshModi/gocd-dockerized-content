FROM ubuntu:latest

# Upgrade system
RUN apt-get -y update && \
  apt-get -y dist-upgrade && \
  apt-get -y clean && \
  apt-get -fy install

# Install gocd-server
WORKDIR /var/go
RUN apt-get -y install \
  wget git openssh-client openjdk-8-jre-headless && \
  wget --output-document go-server.deb https://download.go.cd/binaries/16.8.0-3929/deb/go-server_16.8.0-3929_all.deb && \
  dpkg -i go-server.deb && \
  sed -i -e 's/DAEMON=Y/DAEMON=N/' /etc/default/go-server && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8153 8154

ADD ssh/.ssh /var/go/.ssh
RUN chown -R go:go /var/go && \
  chown -R go:go /var/go/.ssh

CMD ["/etc/init.d/go-server", "start"]
