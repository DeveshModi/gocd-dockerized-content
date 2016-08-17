FROM pritunl/archlinux:latest

# Upgrade system
RUN pacman -Syy --noconfirm
RUN pacman -Suu --noconfirm

### CUT HERE vvvvvvvvvvvvvvvvvvvvvvvvvvv
# "Provision" the box with everything we need to run the jerbs
RUN pacman -S --needed --noconfirm \
  maven \
  sbt scala \
  aws-cli
RUN pacman -S --needed --noconfirm \
  docker docker-compose
RUN systemctl enable docker.service
### CUT HERE ^^^^^^^^^^^^^^^^^^^^^^^^^^^

# Install gocd-agent
RUN pacman -S --noconfirm \
  unzip wget openssh git jdk8-openjdk
RUN wget --output-document go-agent.zip https://download.go.cd/binaries/16.7.0-3819/generic/go-agent-16.7.0-3819.zip
RUN unzip go-agent.zip
RUN mv go-agent-* go-agent
RUN groupadd -f go && \
  useradd -d /var/go -G go go

ADD ../ssh/* /var/go
RUN chown -R go:go /var/go

USER go

CMD ["./go-agent/agent.sh"]
