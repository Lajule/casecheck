PROGRAM = casecheck
VERSION = 0.0.1

INPUT = wordlist.txt

DESTDIR ?= /usr/local/bin/

.PHONY: all
all: $(PROGRAM)

.PHONY: clean
clean:
	$(RM) $(PROGRAM)

.PHONY: check
check: $(PROGRAM)
	test "$$(echo 'I love emacs and GITHUB!' | ./$(PROGRAM))" = "I love Emacs and GitHub!"

.PHONY: install
install: $(PROGRAM)
	install -t $(DESTDIR) $(PROGRAM)

$(PROGRAM):
	{ \
	  printf "#!/bin/sed -f\n"; \
	  printf "# %s %s\n" "$(PROGRAM)" "$(VERSION)"; \
	  while read -r line; do \
	    printf "s/\\\b%s\\\b\(\s\|$$\)/%s\\\1/gi\n" "$${line}" "$${line}"; \
	  done <$(INPUT); \
	} >$@ && chmod +x $@
