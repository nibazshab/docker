FROM alpine AS build

WORKDIR /darkhttpd

RUN apk add --no-cache build-base

ENV CFLAGS="-static -O2 -flto -D_FORTIFY_SOURCE=2 -fstack-clash-protection -fstack-protector-strong -pipe -Wall -Werror=format-security -Werror=implicit-function-declaration -Wl,-z,defs -Wl,-z,now -Wl,-z,relro -Wl,-z,noexecstack"

RUN wget https://github.com/emikulic/darkhttpd/archive/refs/heads/master.tar.gz \
 && tar -xvf master.tar.gz \
 && cd darkhttpd-master \
 && make darkhttpd-static \
 && strip darkhttpd-static

WORKDIR /ariang

RUN wget https://github.com/mayswind/AriaNg/releases/download/1.3.7/AriaNg-1.3.7.zip -O ariang.zip \
 && unzip ariang.zip \
 && rm ariang.zip

WORKDIR /rootfs

RUN mv /darkhttpd/darkhttpd-master/darkhttpd-static darkhttpd \
 && mv /ariang ariang

FROM scratch

COPY --from=build /rootfs /

ENTRYPOINT ["/darkhttpd", "/ariang", "--port", "6880"]
