FROM archlinux

COPY rootfs /

VOLUME ["/home/coder", "/data"]

RUN chmod +x /init

RUN curl -L https://github.com/coder/code-server/releases/download/v4.20.0/code-server-4.20.0-linux-amd64.tar.gz > code-server.tgz \
 && tar -xvf code-server.tgz \
 && rm -rf code-server.tgz \
 && mv code-server-4.20.0-linux-amd64 /usr/lib/code-server \
 && ln -s /usr/lib/code-server/bin/code-server /usr/bin/code-server

RUN curl -L https://github.com/Yelp/dumb-init/releases/latest/download/dumb-init_1.2.5_x86_64 > dumb-init \
 && mv dumb-init /usr/bin/dumb-init \
 && chmod +x /usr/bin/dumb-init

ENTRYPOINT ["/init", "--bind-addr", "0.0.0.0:8080"]
