#!/bin/sh -l

echo "****** SETUP FILES & FOLDERS ******" >&2
mkdir -p /app ~/.ssh
touch ~/.ssh/known_hosts
touch ~/.ssh/id_rsa

echo "****** SET PERMISSIONS ******" >&2
echo "$3" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo "****** SSH SETUP ******" >&2
eval "$(ssh-agent -s)"

echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

ssh-add ~/.ssh/id_rsa

echo "****** GIT SOURCE DATA ******" >&2
git clone $1 /app --depth=1

ls -lah /app

# FIXME: Change the ssh key for project after done
