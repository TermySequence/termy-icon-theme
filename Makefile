APP_NAME=qtermy
PREFIX=/usr/local

dest="$(DESTDIR)$(PREFIX)/share/$(APP_NAME)/icons"

.PHONY: install
install:
	mkdir -p $(dest)
	mkdir -p $(dest)/default
	cd icons/default && source ./install.sh $(dest)/default
	install icons/default/index.theme $(dest)/default
