#!/usr/bin bash

msg () {
  if [ -z "$1" ]; then
    echo "missing definition"
  else
    echo "$1"
  fi
}