fmt:
    nix fmt .

fup:
    nix flake update --commit-lock-file 

codec:
    nix shell .#media-codec

an:
    nix shell .#android-tools

llm:
    nix run .#ollama-cuda
