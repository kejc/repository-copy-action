#!/bin/sh -l

mkdir -p /app ~/.ssh

echo $3 > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo $3 >&2

#git clone $1 /app --depth=1

# FIXME: Change the ssh key for project after done
# FIXME: remove
echo "$1" >&2
echo "$2" >&2
