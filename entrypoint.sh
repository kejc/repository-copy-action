#!/bin/sh -l

echo "****** SET PERMISSIONS ******" >&2
echo "$3" > /root/.ssh/id_rsa

echo "****** SSH SETUP ******" >&2
ssh-add /root/.ssh/id_rsa

echo "****** GIT SOURCE DATA ******" >&2
git clone $1 /app --depth=1

ls -lah /app

# FIXME: Change the ssh key for project after done
