#!/bin/bash

current_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function pwd_folder () {
  echo "$(pwd | sed 's/.*\///g')"
}

export PS1='%F{35}%T%F{white}:$(pwd_folder):%F{31}$(current_branch) %F{white}$'
