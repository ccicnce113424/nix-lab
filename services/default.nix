{ inputs, ... }:
{
  imports = [
    inputs.process-compose-flake.flakeModule
    ./ollama.nix
  ];
  perSystem =
    { system, ... }:
    {
      imports = [
        "${inputs.nixpkgs}/nixos/modules/misc/nixpkgs.nix"
      ];
      nixpkgs = {
        hostPlatform = system;
        # Required for CUDA
        config.allowUnfree = true;
      };
    };
}
