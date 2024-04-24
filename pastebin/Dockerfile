FROM golang AS build

ARG PASTEBIN="https://github.com/nibazshab/pastebin/archive/refs/heads/main.tar.gz"

WORKDIR /rootfs

WORKDIR /build
RUN wget -O- "$PASTEBIN" | tar -zxvf - --strip-components=1 \
 && CGO_ENABLED=0 go build -ldflags="-s -w" \
 && mv pastebin /rootfs

FROM scratch

COPY --from=build /rootfs /

VOLUME ["/tmp"]
ENTRYPOINT ["/pastebin"]
