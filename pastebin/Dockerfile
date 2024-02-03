FROM golang AS build

RUN wget https://github.com/nibazshab/pastebin/archive/refs/heads/main.tar.gz \
 && tar -xvf main.tar.gz \
 && cd pastebin-main \
 && CGO_ENABLED=0 go build -ldflags="-s -w"

WORKDIR /rootfs

RUN mv /go/pastebin-main/pastebin pastebin

FROM scratch

COPY --from=build /rootfs /

VOLUME ["/tmp"]

ENTRYPOINT ["/pastebin"]
