#!/usr/bin/env bash
set -e

curl https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz > go1.13.8.linux-amd64.tar.gz

echo "0567734d558aef19112f2b2873caa0c600f1b4a5827930eb5a7f35235219e9d8 go1.13.8.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.13.8.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go get github.com/zylotech-inc/libpostal-rest

go install github.com/zylotech-inc/libpostal-rest
