#!/usr/bin/env bash
set -e

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ~/.atom ]; then
  mkdir ~/.atom
fi;

ln -sf $BASE_DIR/config.cson ~/.atom/config.cson
ln -sf $BASE_DIR/keymap.cson ~/.atom/keymap.cson

if [[ $(which apm) ]]; then
  while read package ; do
    apm install $package
  done < $BASE_DIR/packages
fi;
