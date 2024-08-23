#!/usr/bin/env doomscript

(require 'doom-start)
(find-file "./thesis.org")

;; (org-latex-export-to-latex)
(org-latex-export-to-latex nil nil nil nil '(:with-title nil))
(org-ascii-export-to-ascii)
(org-html-export-to-html)

(message "[DONE] exporting to latex")
