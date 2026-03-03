{ lib, ... }:
let
  devenvs = {
    python = ./python;
    rust = ./rust;
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
      devShells = lib.mapAttrs (_: p: pkgs.callPackage (p + "/shell.nix") { }) devenvs;
    };
}
