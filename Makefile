SHELL := /bin/sh

program := casecheck
version := 0.0.1
input   := wordlist.txt

.PHONY: all
all: $(program)

.PHONY: clean
clean:
	$(RM) $(program)

.PHONY: install
install: $(program)
	install -t $(DESTDIR) $(program)

SED ?= /bin/sed
EXPR ?= s/\\\b%s\\\b/%s/gi
DESTDIR ?= /usr/local/bin/
$(program): $(input)
	{ \
	  printf "#!$(SED) -f\n"; \
	  printf "#%s %s\n" "$(program)" "$(version)"; \
	  while read -r line; do \
	    printf "$(EXPR)\n" "$${line}" "$${line}"; \
	  done < <(sort -u $(input)); \
	} >$@ && chmod +x $@
