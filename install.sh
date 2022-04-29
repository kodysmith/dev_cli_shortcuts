#!/bin/bash

# constants
CWD=$(PWD);
LIVE=$CWD/live/;
cp $CWD/generic/* $CWD/live/;


echo "what file is sourced at startup? example: .profile or .bashrc or .bash_profile"
read PROFILE;
echo "installing scripts in $PROFILE."


# create the base directory to go live into;
mkdir live;

# write the bootstrapping script to the .bashrc or .profile file
echo "\
##### dev_cli_tools start #####
LIVE=$LIVE;
"'
for f in $(ls $LIVE)
do
  source $LIVE/$f;
done
##### dev_cli_tools end #######
' >> ~/$PROFILE;



# source the scripts right away to see it work immediately
source ~/$PROFILE;
