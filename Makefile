SRC  := $(wildcard csd-*.adoc)
XML  := $(patsubst %.adoc,%.xml,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))
PDF  := $(patsubst %.adoc,%.xml,$(SRC))
DOC  := $(patsubst %.adoc,%.doc,$(SRC))

SHELL := /bin/bash

all: $(HTML) $(XML) $(PDF) $(DOC)

clean:
	rm -f $(HTML) $(XML) $(PDF) $(DOC)

%.xml %.html %.pdf %.doc: %.adoc
	bundle exec metanorma -t csd -x html,pdf,doc,xml $^
	#docker run -v "$$(pwd)":/metanorma/ ribose/metanorma -t csd -x html,pdf $<

open:
	open $(HTML)

.PHONY: bundle all open
