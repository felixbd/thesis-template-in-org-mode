#+begin_src nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (python310.withPackages(ps: with ps; [
	numpy         # for math
	latexify-py   # for converting python funcs to latex
	scipy         # for math and physics
	pygments      # for syntax highlighting
	matplotlib    # for plotting
	seaborn       # for plotting
	scikit-learn  # for ml stuff
    ]))
    texlive.combined.scheme-full
    graphviz
    gnuplot
  ];

  shellHook = ''
    echo "entering dev environment"
  '';
}
