all:
	rm -fr ./out/*

	# DEBUG=1 doomscript ...
	doomscript ./org-export-to-latex.el

	latexmk -shell-escape -bibtex -pdf thesis-template-in-org-mode.tex

	@find . -maxdepth 1 -name 'thesis-*.pdf' -exec mv {} ./out/ \; || true

	# rm -fr ./thesis-template-in-org-mode.*
	# latexmk -c

c: clean

clean:
	rm thesis-template-in-org-mode-blx.bib
	latexmk -c
	rm -fr ./thesis-template-in-org-mode.*
	# rm -fr ./out/*
	rm -fr _minted-thesis-template-in-org-mode

o: open

open:
	open ./out/thesis-template-in-org-mode.pdf

spell:
	aspell -c thesis.org
