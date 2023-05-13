#!/bin/sh -l

git config --global user.email "actions[repository-copy-action]@mail.com"
git config --global user.name "actions[repository-copy-action]"

echo "****** SOURCE REPO HANDLE ******" >&2
echo "$3" > /root/.ssh/id_rsa
ssh-add /root/.ssh/id_rsa
git clone $1 /source --depth=1

echo "****** DESTINATION REPO HANDLE ******" >&2
echo "$4" > /root/.ssh/id_rsa
git clone $2 /dest --depth=1

echo "****** COPY FILES ******" >&2
if [ -f "/source/.gitignore" ]; then
  cp /source/.gitignore /dest/
fi
cp -r /source/* /dest/

echo "****** COMMIT & PUSH ******" >&2
cd /dest
git add .
git commit -am "action[repository-copy-action] $1 -> $2"
git push
cd /

echo "****** FILES ******" >&2
echo ">> source" >&2
ls /source
echo ">> dest" >&2
ls /dest
cat /source/README.md
cat /dest/README.md

# FIXME: Change the ssh key for project after done


