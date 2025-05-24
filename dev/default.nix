{ lib, ... }:
let
  devenvs = {
    template = ./template;
    nix = ./nix;
  };
in
{
  flake.templates = lib.mapAttrs (_: p: { path = p; }) devenvs;
  perSystem =
    { pkgs, ... }:
    {
      devShells = lib.mapAttrs (_: p: pkgs.callPackage "${p}/shell.nix" { }) devenvs;
    };
}
