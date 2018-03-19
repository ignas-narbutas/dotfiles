#!/usr/bin/env bash

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

setup_npm () {

    info "Enter Myget credentials"
    npm config set @trustpilot:registry=https://trustpilot.myget.org/F/npm/npm/
    npm login --registry https://trustpilot.myget.org/F/npm/npm/ --scope=@trustpilot
    npm config set always-auth true --registry https://trustpilot.myget.org/F/npm/npm/

    npm install -g @trustpilot/confocto   
}

info "npm/install.sh"
setup_npm
success "npm/install.sh"