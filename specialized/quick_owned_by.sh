#!/bin/bash
function quick_owned_by () { 
  SEARCH_DIR="static/bundles"; 
  if [[ "$2" ]] {
    SEARCH_DIR=$2;
  }
  NAME=$1; 
  git grep -i $NAME -- $SEARCH_DIR/**/package.json | sed 's/static\/bundles\///g'|sed 's/\/package.json.*//g' |uniq |sort;
}
