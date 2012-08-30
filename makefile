
# use 'sudo make install' to install metaSave in /usr/local/bin

DEST=/usr/local/bin

install: ${DEST}/imtag

/usr/local/bin/imtag: imtag
	install imtag ${DEST}
