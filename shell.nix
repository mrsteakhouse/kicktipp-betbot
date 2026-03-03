{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
  ...
}:
let
  pythonEnv = pkgs.python313.withPackages (
    ps: with ps; [
      numpy
      scipy
      # matplotlib
      pandas
      # jupyter
      pip
    ]
  );

in
pkgs.mkShell {
  packages = [
    pythonEnv
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH:$LD_LIBRARY_PATH"
  '';
}
