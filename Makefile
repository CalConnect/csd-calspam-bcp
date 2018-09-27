SRC  := $(wildcard csd-*.adoc)
XML  := $(patsubst %.adoc,%.xml,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))
PDF  := $(patsubst %.adoc,%.xml,$(SRC))

SHELL := /bin/bash

all: $(HTML) $(XML) $(PDF)

clean:
	rm -f $(HTML) $(XML) $(PDF)

%.xml %.html: %.adoc
	# bundle exec metanorma -t csd -x html,pdf $^
	docker run -v "$$(pwd)":/metanorma/ ribose/metanorma -t csd -x html,pdf $<

open:
	open $(HTML)

