{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd
    nil
    nixfmt-rfc-style
    nix-tree
  ];
}
