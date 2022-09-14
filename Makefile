PROGRAM = casecheck
VERSION = 0.0.1
INPUT = wordlist.txt

SED ?= /bin/sed

DESTDIR ?= /usr/local/bin/

.PHONY: all
all: $(PROGRAM)

.PHONY: clean
clean:
	$(RM) $(PROGRAM)

.PHONY: install
install: $(PROGRAM)
	install -t $(DESTDIR) $(PROGRAM)

$(PROGRAM): $(INPUT)
	{ \
	  printf "#!$(SED) -f\n"; \
	  printf "#%s %s\n" "$(PROGRAM)" "$(VERSION)"; \
	  while read -r line; do \
	    printf "s/\\\b%s\\\b/%s/gi\n" "$${line}" "$${line}"; \
	  done <$(INPUT); \
	} >$@ && chmod +x $@
