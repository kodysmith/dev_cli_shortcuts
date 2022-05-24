#!/bin/bash

function bundle-check {
BUNDLE_PATH=$1;

echo "running unit tests \n" &&
yarn test $BUNDLE_PATH &&
echo "running type check \n" &&
yarn tsc -p $BUNDLE_PATH 
}
