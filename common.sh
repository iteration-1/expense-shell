#!/usr/bin bash

script_location=$(pwd)

msg () {
  if [ -z "$1" ]; then
    echo -e "\e[31mmissing definition\e[0m"
  else
    echo -e "\e[32m$1\e[0m"
  fi
}

get_code () {
  msg "download the code"
  curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip

  msg "unzip the code"
  cd /app
  unzip /tmp/${component}.zip
}