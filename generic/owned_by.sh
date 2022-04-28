#!/bin/bash
# this is a quick function to scan package.json files for string matches. this is not comprehensive, but a rough approximation
# this is just a quick and dirty way to approximate the bundles you own by string matching.... hopefully your name is not 
# something like... Robert Eact... with a git handle REact... you may appear to own all UI bundles in this case.
# if needed I can come up with a much better solution in javascript or something
function owned_by () {
  SEARCH_DIR="static/bundles"
  if [[ -n "$2" ]]
  then
    SEARCH_DIR=$2
  fi
  NAME=$1
  git grep -i $NAME -- $SEARCH_DIR/**/package.json | sed 's/static\/bundles\///g' | sed 's/\/package.json.*//g' | sort |uniq
}
