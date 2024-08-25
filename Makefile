SHELL := /bin/zsh

# Extract the export file name from the Org file
FILENAME := $(shell grep '#+EXPORT_FILE_NAME' thesis.org | cut -d':' -f2 | xargs)

all:
	# rm -fr ./out/* || true
	# if [ "$(ls -A ./out)" ]; then rm -fr ./out/*; fi
	find ./out/ -mindepth 1 -delete

	# DEBUG=1 doomscript ...
	doomscript ./org-export.el

	latexmk -shell-escape -bibtex -pdf "$(FILENAME).tex"

	mv "$(FILENAME)".{pdf,html,txt} ./out
	cp -r img-gen-dir out

	# gen gitlab index page
	python3 gen-index-page.py "$(FILENAME)"


c: clean

clean:
	latexmk -c
	rm -f "./$(FILENAME)-blx.bib"
	rm -f "./$(FILENAME)."*
	rm -fr "_minted-$(FILENAME)"
	# ".auctex-auto/"

o: open

open:
	open "./out/index.html"

op:
	open "./out/$(FILENAME).pdf"

oh:
	open "./out/$(FILENAME).html"

cat:
	open "./out/$(FILENAME).txt"

spell:
	# cat thesis.org | aspell --lang=de list | uniq | wc -l
	aspell --lang=de -c thesis.org
