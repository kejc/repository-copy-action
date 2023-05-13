#!/bin/sh -l

echo "****** SOURCE REPO HANDLE ******" >&2
echo "$3" > /root/.ssh/id_rsa
ssh-add /root/.ssh/id_rsa
git clone $1 /source --depth=1

echo "****** DESTINATION REPO HANDLE ******" >&2
echo "$4" > /root/.ssh/id_rsa
git clone $2 /dest --depth=1
cp -R /source/* /dest/*

# FIXME: Change the ssh key for project after done
