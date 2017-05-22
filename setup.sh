#!/usr/bin/env bash
set -e

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ATOM_HOME=$HOME/.atom
RED='\033[0;31m'
NO_COLOR='\033[0m'

function assert_atom_home_is_created {
  if [ ! -d $ATOM_HOME ]; then
    mkdir $ATOM_HOME
  fi;
}

function link_config_files {
  echo 'Linking config files'
  ln -sf $BASE_DIR/config.cson $ATOM_HOME/config.cson
  ln -sf $BASE_DIR/keymap.cson $ATOM_HOME/keymap.cson
}

function check_if_apm_is_installed {
  if [[ ! $(which apm) ]] ; then
    echo "${RED}Please make sure apm is installed before proceeding${NO_COLOR}"
    exit 1
  fi;
}

function install_packages {
  apm install --packages-file $BASE_DIR/packages
}

assert_atom_home_is_created
check_if_apm_is_installed

link_config_files
install_packages
