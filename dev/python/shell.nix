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

          basedpyright
          ruff
        ]);
      runScript = "zsh";
      extraOutputsToInstall = [ "dev" ];
    }
  )
).env
