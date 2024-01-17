FROM alpine

COPY rootfs /

RUN chmod +x /init

VOLUME ["/c", "/d"]

RUN wget https://github.com/P3TERX/Aria2-Pro-Core/releases/download/1.36.0_2021.08.22/aria2-1.36.0-static-linux-amd64.tar.gz -O aria2.tgz \
 && tar -xvf aria2.tgz \
 && rm -rf aria2.tgz

ENTRYPOINT ["/init"]
