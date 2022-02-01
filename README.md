[![Go Report Card](https://goreportcard.com/badge/github.com/lealoureiro/hello-world-api)](https://goreportcard.com/report/github.com/lealoureiro/hello-world-api)

Simple Hello World API for testing purposes. It is build in Go and it uses Gin web framework.

## Pre-requisites

- Go 1.17
- httpie (optional for testing)
- Docker (optional)

## Run
```bash
go get github.com/lealoureiro/hello-world-api
go run hello-world-api.go
```

## Build & Run Native
```bash
go build hello-world-api.go
./hello-world-api
```

## Docker
```bash
docker build -t hello-world-api .
docker run --rm -p8080:8080 hello-world-api
```