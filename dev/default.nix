{ lib, ... }:
let
  devenvs = {
    template = ./template;
    nix = ./nix;
  };
in
{
  flake.templates = lib.mapAttrs (n: p: {
    path = p;
    description = n;
  }) devenvs;
  perSystem =
    { pkgs, ... }:
    {
      devShells = lib.mapAttrs (_: p: pkgs.callPackage "${p}/devshell.nix" { }) devenvs;
    };
}
