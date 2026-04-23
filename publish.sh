#!/bin/sh
# Usage: ./publish.sh <dir>

if [ -z "$1" ];
then
  echo "Error: Please specify the folder to deploy (e.g. ./publish.sh <dir>)"
  exit 1
fi

@pushd $1
git add --all
if [ -n "$FORCE_COMMIT" ];
then
  git commit --allow-empty -m `date +%s`
else
  git commit -m `date +%s`
fi
# git push origin gh-pages
@popd
