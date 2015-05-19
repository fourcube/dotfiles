#!/usr/bin/env bash

function download() {
	URL=$1
	ARCHIVE=$2

	if [ -f "./tmp/$ARCHIVE" ]; then
		echo "$ARCHIVE exists."
		return
	fi

	wget --show-progress -q -O "./tmp/$ARCHIVE.tmp" $URL
	if [ ! $? -eq 0 ]; then
		echo "Failed download."
	  exit -1
	fi

	mv "./tmp/$ARCHIVE.tmp" "./tmp/$ARCHIVE"
}
