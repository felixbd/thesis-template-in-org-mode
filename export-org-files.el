#!/usr/bin/env doomscript

;; (defcli! export-notes (&args files)
  (require 'doom-start) ; load your user config

  ;; (org-special-block-extras-mode)

  ;; Customize the LaTeX PDF process (if needed)
  (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

  ;; Define the path to your Org file
  (defvar org-file-path "./thesis.org")

  ;; Open the Org file
  (find-file org-file-path)

  ;; (dolist (file files)             ; supports multiple files, if you want
    ;;(find-file file)               ; open an org file
    (org-latex-export-to-pdf)      ; and export it
    ;; (org-ascii-export-to-ascii)
    ;; (org-html-export-to-html)
    ;; (org-latex-export-to-pdf)
  ;;)

  (message "[DONE] exporting")
;; )

;;(run! "export-notes" (cdr (member "--" argv)))
