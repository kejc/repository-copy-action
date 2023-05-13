#!/bin/sh -l

mkdir -p /app ~/.ssh

echo "$1" >&2
echo "$2" >&2

echo $1 > ~/.ssh/id_rsa

cat ~/.ssh/id_rsa

#git clone $1 /app --depth=1
