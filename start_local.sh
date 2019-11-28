#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Windows;;
    MINGW*)     machine=Windows;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" == "Windows" ] ; then
  WINPTY="winpty"
else
  SUDO="sudo -EHu app"
fi

if [ "$1" == "build" ]; then
  docker-compose build
  exec $WINPTY docker-compose run --rm ansible
else
  exec $WINPTY docker-compose run --rm ansible
fi
