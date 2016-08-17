FROM pritunl/archlinux:latest

# Upgrade system
RUN pacman -Syy --noconfirm && \
  pacman -Suu --noconfirm

### CUT HERE vvvvvvvvvvvvvvvvvvvvvvvvvvv
# "Provision" the box with everything we need to run the jerbs
RUN pacman -S --needed --noconfirm \
  maven \
  sbt scala \
  aws-cli && \

  pacman -S --needed --noconfirm \
  docker docker-compose && \
  systemctl enable docker.service
### CUT HERE ^^^^^^^^^^^^^^^^^^^^^^^^^^^

# Install gocd-agent
RUN pacman -S --noconfirm \
  unzip wget openssh git jdk8-openjdk && \
  wget --output-document go-agent.zip https://download.go.cd/binaries/16.7.0-3819/generic/go-agent-16.7.0-3819.zip && \
  unzip go-agent.zip && \
  mv go-agent-* go-agent

ADD .ssh /var/go
RUN groupadd -f go && \
  useradd -d /var/go -g go go && \
  chown -R go:go /var/go
USER go

CMD ["./go-agent/agent.sh"]
