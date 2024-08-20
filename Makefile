all: c
	# DEBUG=1 doomscript ./export-org-files.el
	doomscript ./export-org-files.el
	@find . -maxdepth 1 \( -name 'thesis-*.pdf' -o -name 'thesis-*.html' -o -name 'thesis-*.txt' \) -exec mv {} ./out/ \; || true
	rm -fr ./thesis-template-in-org-mode.*

x:
	pdflatex -shell-escape thesis-template-in-org-mode.tex

c: clean

clean:
	rm -fr ./thesis-template-in-org-mode.*
	rm -fr ./out/*
	rm -fr _minted-thesis-template-in-org-mode

o: open

open:
	open ./out/thesis-template-in-org-mode.pdf

spell:
	aspell -c thesis.org
