APP_NAME=qtermy
PREFIX=/usr/local
DATADIR=$(PREFIX)/share

dest="$(DESTDIR)$(DATADIR)/$(APP_NAME)/icons"

.PHONY: install
install:
	mkdir -p $(dest)
	mkdir -p $(dest)/default
	cd icons/default && /bin/sh ./install.sh $(dest)/default
	install -m 644 icons/default/index.theme $(dest)/default
