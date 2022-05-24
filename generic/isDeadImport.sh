#!/bin/bash
isDead () {
	FOLDER=$1 
	FILE=$2 
	git grep "import" -- "$FOLDER" | grep -v "\/\*" | grep -vE ^\ \  | grep -v \*\/ | grep -v ^\  | grep -v tests | grep -v mocks | grep "$FILE"
}
