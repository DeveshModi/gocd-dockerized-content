FROM gocd/gocd-server

COPY .ssh /var/go

RUN chown -R go:go /var/go

CMD ["/sbin/my_init"]


