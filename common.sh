#!/usr/bin bash

script_location = $(pwd)
msg () {
  if [ -z "$1" ]; then
    echo -e "\e[31mmissing definition\e[0m"
  else
    echo -e "\e[32m$1\e[0m"
  fi
}