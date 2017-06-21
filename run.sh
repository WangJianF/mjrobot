#!/bin/sh

pkill mjrobot

go build -o mjrobot main.go

mjrobot "127.0.0.1:8888" "127.0.0.1:9999" 
