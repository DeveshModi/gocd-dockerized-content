FROM gocd/gocd-server

COPY .ssh/ /var/go/.ssh/

RUN chown -R go:go /var/go

CMD ["/sbin/my_init"]
