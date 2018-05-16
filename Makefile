SRC  := $(wildcard csd-*.adoc)
XML := $(patsubst %.adoc,%.xml,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))

SHELL := /bin/bash

all: $(HTML) $(XML)

clean:
	rm -f $(HTML) $(XML)

%.xml %.html: %.adoc
	bundle exec asciidoctor -b csd -r 'asciidoctor-csd' $^ --trace

open:
	open $(HTML)

