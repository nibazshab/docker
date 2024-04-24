FROM alpine AS build

ARG ARIA2="https://github.com/abcfy2/aria2-static-build/releases/download/1.37.0/aria2-x86_64-linux-musl_libressl_static.zip"

WORKDIR /rootfs
COPY rootfs .
RUN chmod +x init

WORKDIR /build
RUN wget -O aria2.zip "$ARIA2" \
 && unzip -d /rootfs aria2.zip

FROM alpine

COPY --from=build /rootfs /
RUN apk add --no-cache curl

VOLUME ["/c", "/d"]
ENTRYPOINT ["/init"]
