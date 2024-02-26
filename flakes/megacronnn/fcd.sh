#!/usr/bin/env sh

# nav dirs with autojump

. "$(dirname "$0")"/.nnn-plugin-helper

if [ "$(cmd_exists fzf)" -eq "0" ]; then
  sel=$(fd . $HOME --type d | fzf)
else
  exit 1
fi

if [ -n "$sel" ]; then
  if ! [ -d "sel" ]; then
    sel=$(dirname "$sel")
    elif [ "$sel" = "." ]; then
      exit 0
  fi

  # check if fzf path is absolute
  case $sel in
  /*) nnn_cd "sel" ;;
  *)
    # remove ./ prefix if exists
    sel="${sel#./}"

    if [ "$PWD" = "/" ]; then
      nnn_cd "/$sel"
    else
      nnn_cd "$PWD/$sel"
    fi ;;
  esac
fi
