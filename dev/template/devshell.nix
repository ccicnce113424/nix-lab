{ pkgs, ... }:
pkgs.mkShell.override
  {
    # stdenv = pkgs.clangStdenv;
  }
  {
    packages = with pkgs; [ just ];
  }
