pruneDeadFiles () {
	FOLDER=$1 
	for f in $(ls $FOLDER/*.ts* |sed 's/static\///g' |sed 's/\.tsx//g')
	do
		isDead $f && echo "dead file $f" && rm static/$f.tsx
	done
}
