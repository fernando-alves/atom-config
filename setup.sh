#!/bin/bash

if [ ! -d ~/.atom ]; then
  mkdir ~/.atom
fi;

ln -sf $(pwd)/config.cson ~/.atom/config.cson
ln -sf $(pwd)/keymap.cson ~/.atom/keymap.cson
