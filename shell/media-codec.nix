{ pkgs, ... }:
{
  packages.media-codec = pkgs.buildEnv {
    name = "media-codec";
    paths = with pkgs; [
      ffmpeg-full

      nur.repos.xddxdd.ncmdump-rs

      (pkgs.av1an.override {
        withSvtav1 = true;
        withRav1e = true;
        withVmaf = true;
      })
    ];
  };
}
