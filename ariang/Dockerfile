FROM alpine AS build

ARG ARIANG="https://github.com/mayswind/AriaNg/releases/download/1.3.7/AriaNg-1.3.7.zip"
ARG DARKHTTPD="https://github.com/emikulic/darkhttpd/archive/refs/tags/v1.16.tar.gz"
ARG CFLAGS="-static -O2 -flto -D_FORTIFY_SOURCE=2 -fstack-clash-protection -fstack-protector-strong -pipe -Wall -Werror=format-security -Werror=implicit-function-declaration -Wl,-z,defs -Wl,-z,now -Wl,-z,relro -Wl,-z,noexecstack"

WORKDIR /rootfs

WORKDIR /build/ariang
RUN wget -O ariang.zip "$ARIANG" \
 && unzip -d /rootfs/ariang ariang.zip

WORKDIR /build/darkhttpd
RUN apk add --no-cache build-base
RUN wget -O- "$DARKHTTPD" | tar -zxvf - --strip-components=1 \
 && make darkhttpd \
 && strip darkhttpd \
 && mv darkhttpd /rootfs

FROM scratch

COPY --from=build /rootfs /

ENTRYPOINT ["/darkhttpd", "/ariang", "--port", "6880"]
