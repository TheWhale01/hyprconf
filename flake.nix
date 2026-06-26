{
  description = "Hyprland configuration for https://github.com/TheWhale01/nixos-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              lua
              lua-language-server
              brightnessctl
              pamixer
              playerctl
              pulseaudio
              libnotify
            ];
            shellHook = ''
              echo "Entered hyprconf dev env !"
            '';
          };
        }
      );
    };
}
