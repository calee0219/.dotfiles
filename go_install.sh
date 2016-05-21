#!/bin/bash

# setup go
export GOPATH=$HOME/Programming/Go
export PATH=$PATH:$GOPATH/bin

# gocode is used by many editors to provide intellisense
go get -u github.com/nsf/gocode
# gotags is a ctags-compatible tag generator for Go
go get -u github.com/jstemmer/gotags
# goimports is something you should run when saving code to fill in import paths
go get -u golang.org/x/tools/cmd/goimports
# golint should be run after every build to check your code
go get -u github.com/golang/lint/golint
# find symbol information in Go source
go get -u github.com/rogpeppe/godef

# goserv
#go get -u github.com/gotschmarcel/goserv
# gorename is used by many editors to provide identifier rename support
#go get -u golang.org/x/tools/cmd/gorename
# oracle is a tool that help with code navigation and search
#go get -u golang.org/x/tools/cmd/oracle
