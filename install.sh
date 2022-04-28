#!/bin/bash
echo "what file is sourced at startup? example: .profile"
read PROFILE;
echo "installing scripts in $PROFILE."
CWD=$(PWD);
GENERIC=$CWD/generic/;
echo "\
##### dev_cli_tools start #####
GENERIC=$GENERIC;
"'
for f in $(ls $GENERIC);
do;
  source $f;
done;
##### dev_cli_tools end #######
' >> ~/$PROFILE;
