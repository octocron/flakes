#!/usr/bin/env sh

if ! [ -z "$1" ] && [ -s "$1" ]; then
  cp "$1" $HOME/mecacron/in
  exit 2
else
  printf "empty file!!"
fi

read -r _
