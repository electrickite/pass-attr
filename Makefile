PREFIX ?= /usr
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions
MANDIR ?= $(PREFIX)/share/man
BASHCOMPDIR ?= /etc/bash_completion.d

all:
	@echo "pass-attr is a shell script and does not need compilation, it can be simply executed."
	@echo ""
	@echo "To install it try \"make install\" instead."

install:
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -v -m 0644 man/pass-attr.1 "$(DESTDIR)$(MANDIR)/man1/pass-attr.1"
	@install -v -d "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/"
	@install -v -m0755 src/attr.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/attr.bash"
	@install -v -m0755 src/line.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/line.bash"
	@install -v -d "$(DESTDIR)$(BASHCOMPDIR)/"
	@install -v -m 644 completion/pass-attr.bash.completion "$(DESTDIR)$(BASHCOMPDIR)/pass-attr"

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/attr.bash" \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/line.bash" \
		"$(DESTDIR)$(MANDIR)/man1/pass-attr.1" \
		"$(DESTDIR)$(BASHCOMPDIR)/pass-attr"

lint:
	shellcheck -s bash src/attr.bash
	shellcheck -s bash src/line.bash

.PHONY: install uninstall lint

