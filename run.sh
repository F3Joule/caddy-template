#!/bin/bash

set -e
pushd . > /dev/null

cd "$(dirname ${BASH_SOURCE[0]})"

start_caddy(){
  docker-compose up $1
}

stop_caddy(){
  docker-compose down $1
}

if [[ -z $1 ]]; then
  start_caddy -d
else
  case $1 in
    "no-daemon")
      start_caddy
      ;;

    "restart")
      stop_caddy && start_caddy -d
      ;;

    "clean-restart")
      stop_caddy -v && start_caddy -d
      ;;

    "stop")
      stop_caddy
      ;;

    *)
      printf "\033[0;31mError:\033[00m Uknown option provided %s\n" "$1"
      exit 1
      ;;
  esac
fi


popd > /dev/null
exit 0
