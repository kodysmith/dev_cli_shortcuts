#!/bin/bash
echo "what file is sourced at startup? example: .profile"
read PROFILE;
echo "installing scripts in $PROFILE."
CWD=$(PWD);
LIVE=$CWD/live/;
cp $CWD/generic/* $CWD/live/;
echo "\
##### dev_cli_tools start #####
LIVE=$LIVE;
"'
for f in $(ls $LIVE);
do;
  source $LIVE/$f;
done;
##### dev_cli_tools end #######
' >> ~/$PROFILE;
source ~/$PROFILE;
