{
  pkgs ? import <nixpkgs> { },
  ...
}:
(pkgs.buildFHSEnv {
  name = "python-dev-env";
  targetPkgs =
    pkgs: with pkgs; [
      gcc
      glibc
      zlib
      python313
      python313Packages.pip
    ];
  runScript = "bash --init-file /etc/profile";
}).env
