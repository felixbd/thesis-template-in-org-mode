main: d

clean:
	rm thesis-template-in-org-mode.*

doom:
	~/.config/emacs/bin/doom run &

d: doom

spell:
	aspell -c README.org
