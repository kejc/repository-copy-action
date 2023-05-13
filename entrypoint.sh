#!/bin/sh -l

echo "****** SOURCE REPO HANDLE ******" >&2
echo "$3" > /root/.ssh/id_rsa
ssh-add /root/.ssh/id_rsa
git clone $1 /source --depth=1

echo "****** DESTINATION REPO HANDLE ******" >&2
echo "$4" > /root/.ssh/id_rsa
git clone $2 /dest --depth=1

#echo "****** COPY FILES ******" >&2
#if [ -f "/source/.gitignore" ]; then
#  cp /source/.gitignore /dest/
#fi
#cp -R /source/* /dest/*
#
#echo "****** COMMIT & PUSH ******" >&2
#git add .
#git commit -am "action[repository-copy-action] $1 -> $2"
#git push

ls /source
ls /dest

# FIXME: Change the ssh key for project after done


