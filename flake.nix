rec {
  description = "Nix flake containing devShells and services, etc";

  inputs = {
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs."flake-parts".follows = "flake-parts";
      inputs."treefmt-nix".follows = "treefmt-nix";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-compat.url = "github:edolstra/flake-compat";
    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
    services-flake.url = "github:juspay/services-flake";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      _module.args = { inherit nixConfig; };
      systems = [ "x86_64-linux" ];
      imports = [
        ./services
        # use `nix shell` to enter environment defined with pkgs.buildEnv
        ./shell
        ./treefmt.nix
        ./nixpkgs.nix
      ];
    };

  nixConfig = {
    trusted-users = [ "@wheel" ];
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
    accept-flake-config = true;
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://numtide.cachix.org"
      # "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
