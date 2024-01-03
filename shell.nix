{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (python310.withPackages(ps: with ps; [ numpy latexify-py scipy pygments ]))
    graphviz
  ];

  shellHook = ''
    echo "entering dev environment"
  '';
}
