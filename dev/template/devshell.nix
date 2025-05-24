{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default =
        pkgs.mkShell.override
          {
            # stdenv = pkgs.clangStdenv;
          }
          {
            packages = with pkgs; [ just ];
          };
    };
}
