SRC  := $(wildcard csd-*.adoc)
XML  := $(patsubst %.adoc,%.xml,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))
DOC  := $(patsubst %.adoc,%.doc,$(SRC))
PDF  := $(patsubst %.adoc,%.pdf,$(SRC))

SHELL := /bin/bash

all: $(HTML) $(XML) $(PDF)

clean: clean-pdf clean-xml clean-html clean-doc

clean-pdf:
	rm -f $(PDF)

clean-doc:
	rm -f $(DOC)

clean-xml:
	rm -f $(XML)

clean-html:
	rm -f $(HTML)

bundle:
	bundle

%.xml %.html %.doc:	%.adoc | bundle
	bundle exec metanorma -t csd -x xml,pdf,html,doc $^
	# docker run -v "$$(pwd)":/metanorma/ --entrypoint='/bin/sh' ribose/metanorma -c 'bundle; metanorma -t csd -x xml,pdf,html,doc $<'

html: clean-html $(HTML)

open:
	open $(HTML)

.PHONY: bundle all open
