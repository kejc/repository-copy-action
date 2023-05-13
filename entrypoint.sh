#!/bin/sh -l

echo "$1" >&2
echo "$2" >&2

echo $1 > ~/.ssh/id_rsa

#mkdir /app
#git clone $1 /app --depth=1
