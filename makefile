
# use 'sudo make install' to install metaSave in /usr/local/bin

DEST=/usr/local/bin

install: ${DEST}/metaSave

/usr/local/bin/metaSave: metaSave
	install metaSave ${DEST}
