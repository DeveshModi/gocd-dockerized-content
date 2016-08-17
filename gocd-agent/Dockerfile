FROM pritunl/archlinux:latest

# Optimize pacman mirrors
RUN pacman -Syy
RUN pacman -S --noconfirm reflector
RUN reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

# Upgrade system
RUN pacman -Syy --noconfirm
RUN pacman -Suu --noconfirm

# Install gocd-agent
RUN pacman -S --noconfirm \
  unzip wget openssh git jdk8-openjdk
RUN wget --output-document go-agent.zip https://download.go.cd/binaries/16.7.0-3819/generic/go-agent-16.7.0-3819.zip
RUN unzip go-agent.zip
RUN mv go-agent-* go-agent

# FIXME: mega hack to match userid with gocd-server
# free up id 999
RUN usermod -u 1001 $(getent passwd | awk -F: '$3 == 999 { print $1 }')
RUN groupmod -g 1001 $(getent passwd | awk -F: '$4 == 999 { print $1 }')
# add go user with id = 999 (same as gocd-server image)
RUN groupadd -f -g 999 go && \
  useradd -d /var/go -u 999 -g go go

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

USER go
CMD ["./go-agent/agent.sh"]
