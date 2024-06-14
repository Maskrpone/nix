{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs : 
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [
					./configuration.nix
				];
			};
		};
		homeConfigurations = {
			maskrpone = home-manager.lib.homeManagerConfiguration {
				extraSpecialArgs = { inherit inputs; };
				inherit pkgs;	
				modules = [ ./home.nix ];
			};
		};
	};

}
