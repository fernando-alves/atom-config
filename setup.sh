#!/bin/bash

set -e

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ~/.atom ]; then
  mkdir ~/.atom
fi;

ln -sf $BASE_DIR/config.cson ~/.atom/config.cson
ln -sf $BASE_DIR/keymap.cson ~/.atom/keymap.cson
