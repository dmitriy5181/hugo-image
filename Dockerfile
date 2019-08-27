FROM golang:alpine AS build
RUN apk add --no-cache git
RUN GO111MODULE=on go get -v github.com/gohugoio/hugo@v0.57.2

FROM alpine:latest
COPY --from=build /go/bin/hugo /usr/bin
ENTRYPOINT /usr/bin/hugo
