#!/usr/bin/env doomscript

(require 'doom-start)
(find-file "./thesis.org")
(org-latex-export-to-latex)
(message "[DONE] exporting to latex")
