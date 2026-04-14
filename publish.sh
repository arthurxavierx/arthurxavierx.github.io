#!/bin/sh
# Usage: ./publish.sh dist

if [ -z "$1" ] then
  echo "Error: Please specify the folder to deploy (e.g. ./publish.sh dist)"
  exit 1
fi

git subtree push --prefix "$1" origin gh-pages
