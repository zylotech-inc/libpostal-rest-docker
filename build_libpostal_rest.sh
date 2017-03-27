#!/usr/bin/env bash
set -e

curl https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz > go1.6.2.linux-amd64.tar.gz

echo "e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a  go1.6.2.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.6.2.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go get github.com/johnlonganecker/libpostal-rest

go install github.com/johnlonganecker/libpostal-rest
