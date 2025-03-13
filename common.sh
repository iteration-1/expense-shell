#!/usr/bin bash

msg () {
  if [ -z "$1" ]; then
    echo "\e[31mmissing definition\e[0m"
  else
    echo "\e[32m$1\e[0m"
  fi
}