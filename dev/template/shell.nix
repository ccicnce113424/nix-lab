{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShell.override
  {
    # stdenv = pkgs.clangStdenv;
  }
  {
    packages = with pkgs; [ just ];
  }
