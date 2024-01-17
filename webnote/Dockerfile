FROM golang AS build

RUN wget https://github.com/nibazshab/webnote/archive/refs/heads/main.tar.gz \
 && tar -xvf main.tar.gz \
 && cd webnote-main \
 && CGO_ENABLED=0 go build -ldflags="-s -w"

WORKDIR /rootfs

RUN mv /go/webnote-main/webnote webnote

FROM scratch

COPY --from=build /rootfs /

VOLUME ["/tmp"]

ENTRYPOINT ["/webnote"]
