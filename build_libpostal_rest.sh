#!/usr/bin/env bash
curl https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz > go1.6.2.linux-amd64.tar.gz

tar xzf go1.6.2.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go get github.com/johnlonganecker/libpostal-rest

go install github.com/johnlonganecker/libpostal-rest
