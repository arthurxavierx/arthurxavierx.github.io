#!/bin/sh
# Usage: ./publish.sh <dir>

if [ -z "$1" ];
then
  echo "Error: Please specify the folder to deploy (e.g. ./publish.sh <dir>)"
  exit 1
fi

pushd $1
git add --all
git commit -m `date +%s`
git push origin gh-pages
popd
