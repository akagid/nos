FROM golang:1.18-alpine

RUN apk update
RUN apk add --update --no-cache git
RUN apk add --update --no-cache openssh
RUN apk add --update --no-cache build-base

RUN go install github.com/cweill/gotests/gotests@v1.6.0
RUN go install github.com/fatih/gomodifytags@v1.16.0
RUN go install github.com/josharian/impl@v1.1.0
RUN go install github.com/haya14busa/goplay/cmd/goplay@v1.0.0
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@v0.3.3
RUN go install golang.org/x/tools/gopls@latest

RUN go install github.com/cosmtrek/air@latest

WORKDIR /code

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .
