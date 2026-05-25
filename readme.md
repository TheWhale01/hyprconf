# Hyprconf

This repository contains my hyprland configuration used in my nixos configuration:
[https://github.com/TheWhale01/nixos-config](https://github.com/TheWhale01/nixos-config)

it can be used on any distribution that supports hyprland. Feel free to use it !

## Setup

### NixOS

```nix
# flake.nix
{
	description = "hyprland configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		hyprconf = {
		  url = "github:TheWhale01/hyprconf";
			flake = false;
		};
	};
	outputs = {
	  nixpkgs,
		hyprconf,
		...
	}@inputs:
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = import nixpkgs {
			system = "${system}";
			config.allowUnfree = true;
		};
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				inherit pkgs;
				specialArgs = { inherit inputs; };
				modules = [
					./configuration.nix
				];
			};
		};
	};
}
```

```nix
# configuration.nix
{ hyprconf, ... }:

{
  xdg.configFile.hyprland.source = hyprconf;
}
```

### Other distros

```bash
git clone https://github.com/TheWhale01/hyprconf ~/.config/hypr
Hyprland
```
