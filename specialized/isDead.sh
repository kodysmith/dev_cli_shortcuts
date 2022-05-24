isDead () {
	FILE=$1 
	FOUND=$(associated_bundles $1) 
	[ ! "$FOUND" ]
}
