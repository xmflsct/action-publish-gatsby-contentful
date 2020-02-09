#!/bin/bash

set -e

yarn
CONTENTFUL_SPACEID=$5 CONTENTFUL_ACCESSTOKEN=$6 gatsby build
if [$7 -eq 1]
  then
    yarn run gh-pages -d public -b $1 -u ''"$3"' ''<'"$4"'>' -r 'https://'"$2"'@github.com/'"$GITHUB_REPOSITORY"'.git' -m 'Build of '"$GITHUB_SHA"''
  else
    yarn run gh-pages -d public -b $1 -u ''"$3"' ''<'"$4"'>' -r 'https://'"$2"'@github.com/'"$GITHUB_REPOSITORY"'.git' -m 'Build by publishing on Contentful'
fi
