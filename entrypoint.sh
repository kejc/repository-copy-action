#!/bin/sh -l

mkdir -p /app ~/.ssh

echo $3 > ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

#git clone $1 /app --depth=1

# FIXME: remove
echo "$1" >&2
echo "$2" >&2
