create-bundle () {
	echo "what is the bundle name? "
	read bundleName
	mkdir static/bundles/$bundleName
	yarn bundle-tools fix-package static/bundles/$bundleName
	cp static/bundles/assess-common/tsconfig.json static/bundles/$bundleName/
	mkdir static/nls/$bundleName
}
