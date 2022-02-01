FROM golang:1.17.6-alpine3.15 as builder

LABEL maintainer="Leandro Loureiro <leandroloureiro@pm.me>"

ARG APP_VERSION=dev

WORKDIR $GOPATH/src/github.com/lealoureiro/hello-world-api

COPY config config
COPY hello-world-api.go .
COPY go.mod .

RUN go mod download
RUN go get github.com/lealoureiro/hello-world-api
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-X 'github.com/lealoureiro/hello-world-api/config.Version=${APP_VERSION}'" -installsuffix cgo -o /go/bin/hello-world-api .

FROM alpine:3.15.0

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/bin/hello-world-api .

ENV GIN_MODE=release

EXPOSE 8080

CMD ["./hello-world-api"]