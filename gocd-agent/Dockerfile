FROM pritunl/archlinux:latest

# Upgrade system
RUN pacman -Syy --noconfirm && \
  pacman -Suu --noconfirm

### CUT HERE vvvvvvvvvvvvvvvvvvvvvvvvvvv
# "Provision" the box with everything we need to run the jerbs
RUN pacman -S --needed --noconfirm \
  jdk8-openjdk \
  maven \
  sbt scala \
  aws-cli \
  npm nodejs \
  docker docker-compose && \
  systemctl enable --now docker.service && \
  archlinux-java set java-8-openjdk
### CUT HERE ^^^^^^^^^^^^^^^^^^^^^^^^^^^

# Install gocd-agent
WORKDIR /var/go
RUN pacman -S --noconfirm --needed \
  unzip wget openssh git jdk8-openjdk && \
  archlinux-java set java-8-openjdk && \
  wget --output-document go-agent.zip https://download.go.cd/binaries/16.7.0-3819/generic/go-agent-16.7.0-3819.zip && \
  unzip go-agent.zip && \
  rm go-agent.zip && \
  mv go-agent-* go-agent

ADD ssh/.ssh /var/go/.ssh
RUN groupadd -f go && \
  useradd -d /var/go -g go go && \
  chown -R go:go /var/go && \
  chown -R go:go /var/go/.ssh && \
  gpasswd -a go docker
USER go

CMD ["./go-agent/agent.sh"]
