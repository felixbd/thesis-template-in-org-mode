# -*- mode: org; -*-

#+name: git_version
#+begin_src sh :exports none :results output
git describe --tags --first-parent --abbrev=11 --long --always  # --dirty
#+end_src

#+RESULTS: git_version
#+begin_example
db84e07e1a3
#+end_example

#+name: git_version_latex_comand
#+begin_src python :exports results :var x=git_version :wrap export latex
return r"\newcommand{\gitVersion}{\texttt{" + x[:-1] + r"}}"
#+end_src

#+RESULTS: git_version_latex_comand
#+begin_export latex
\newcommand{\gitVersion}{\texttt{db84e07e1a3}}
#+end_export
