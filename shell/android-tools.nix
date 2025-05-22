{ pkgs, ... }:
{
  packages.android-tools = pkgs.buildEnv {
    name = "android-tools";
    paths = with pkgs; [
      android-tools
      apktool
      payload-dumper-go
      scrcpy
    ];
  };
}
