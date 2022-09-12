PROGRAM = casecheck

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
	  while read -r line; do \
	    printf "s/\(\(^\|\s\)\W\\\?\)%s\(\W\\\?\(\s\|$$\)\)/\\\1%s\\\3/gi\n" "$${line}" "$${line}"; \
	  done <$(INPUT); \
	} >$@ && chmod +x $@
