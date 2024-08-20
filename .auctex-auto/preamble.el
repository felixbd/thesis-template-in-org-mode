(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "ngerman" "british") ("inputenc" "utf8") ("fontenc" "T1") ("FiraSans" "sfdefault" "lining") ("csquotes" "german=guillemets")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "babel"
    "amsmath"
    "amssymb"
    "amsthm"
    "amsfonts"
    "amsbsy"
    "latexsym"
    "mathtools"
    "extarrows"
    "inputenc"
    "fontenc"
    "enumerate"
    "url"
    "graphicx"
    "FiraSans"
    "tikz"
    "pgfplots"
    "csquotes"
    "subcaption"
    "lipsum"
    "units"
    "dirtree")
   (TeX-add-symbols
    '("stetig" 2)
    '("series" 1)
    '("expo" 1)
    '("inds" 1)
    '("indb" 2)
    '("induction" 1)
    '("field" 1)
    "fline"
    "N"
    "Z"
    "Q"
    "R"
    "C"
    "K"
    "B"
    "proofcon"
    "proofind"
    "indv"
    "topologie")
   (LaTeX-add-environments
    "abstract")
   (LaTeX-add-amsthm-newtheorems
    "fakt"
    "fazit"
    "satz"
    "theo"
    "lemma"
    "chara"
    "defi"
    "termi"
    "beh"
    "rem"
    "folg"
    "korr"
    "bsp"
    "bspe"
    "aufg"))
 :latex)

