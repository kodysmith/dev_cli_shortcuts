#!/bin/bash
function associated_bundles () { FOLDER_PATH=$1; git grep $FOLDER_PATH | sed 's/:.*//g' |sort |uniq |sed 's/static\/bundles\///g' |sed 's/\/.*//g' |uniq}
