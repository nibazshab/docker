FROM golang AS build

ARG WEBNOTE="https://github.com/nibazshab/webnote/archive/refs/heads/main.tar.gz"

WORKDIR /rootfs

WORKDIR /build
RUN wget -O- "$WEBNOTE" | tar -zxvf - --strip-components=1 \
 && CGO_ENABLED=0 go build -ldflags="-s -w" \
 && mv webnote /rootfs

FROM scratch

COPY --from=build /rootfs /

VOLUME ["/tmp"]
ENTRYPOINT ["/webnote"]
