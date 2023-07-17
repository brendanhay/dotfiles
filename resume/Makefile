SHELL=/usr/bin/env bash

SOURCE_DOCS := $(wildcard *.md)

OUTPUT_DOCS = \
 $(SOURCE_DOCS:.md=.html) \
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.rtf)

PANDOC=pandoc

PANDOC_OPTIONS= \
 --standalone \
 --metadata title="Brendan Hay" \
 -f markdown-smart \
 -V geometry:margin=2cm \

PANDOC_HTML_OPTIONS=--to html5
PANDOC_PDF_OPTIONS=
PANDOC_DOCX_OPTIONS=
PANDOC_RTF_OPTIONS=

%.html: %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

%.pdf: %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<

%.docx: %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@ $<

%.rtf: %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_RTF_OPTIONS) -o $@ $<

.PHONY: all clean

all: $(OUTPUT_DOCS)

clean:
	- $(RM) $(OUTPUT_DOCS)
