{ inputs, ... }:
{
  imports = [
    inputs.process-compose-flake.flakeModule
    ./ollama.nix
  ];
  perSystem =
    { ... }:
    {
      imports = [
        inputs.services-flake.processComposeModules.default
      ];
    };
}
