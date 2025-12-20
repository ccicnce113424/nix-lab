{ lib, ... }:
let
  devenvs = {
    python = ./python;
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
      devShells = lib.mapAttrs (_: p: pkgs.callPackage "${p}/shell.nix" { }) devenvs;
    };
}
