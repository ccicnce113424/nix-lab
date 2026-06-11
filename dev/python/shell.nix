{
  pkgs ? import <nixpkgs> { },
}:
(
  let
    base = pkgs.appimageTools.defaultFhsEnvArgs;
  in
  pkgs.buildFHSEnv (
    base
    // {
      name = "FHS";
      targetPkgs =
        pkgs:
        (with pkgs; [
          gcc
          glibc
          zlib
          python313
          python313Packages.pip
        ]);
      runScript = "zsh";
      extraOutputsToInstall = [ "dev" ];
    }
  )
).env
