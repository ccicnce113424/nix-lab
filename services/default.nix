{ inputs, ... }:
{
  imports = [
    inputs.process-compose-flake.flakeModule
    ./ollama.nix
  ];
}
