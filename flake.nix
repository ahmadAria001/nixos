{
  description = "Just my flakes configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyprland.url = "github:hyprland-community/pyprland";

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    #spicetify-nix = {
    #  url = "github:Gerg-L/spicetify-nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { 
	  self, 
	  nixpkgs, 
	  #nixvim, 
	  #spicetify-nix,
	  pyprland,
	  flake-utils,
	  ... 
  }@inputs:
   let
      system = "x86_64-linux";
      config = {
      	allowUnfree = true;
	allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
             "intelephense"
	     "nvidia-x11"
        ];
      	android_sdk.accept_license = true;
	nvidia-x11.unfreeRedistributable = true;
      };
      pkgs = import nixpkgs {
      	inherit system;
	config = {
		allowUnfree = true;
		allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
		     "intelephense"
		    "nvidia-x11"
		];
		android_sdk.accept_license = true;
		nvidia-x11.unfreeRedistributable = true;
	};
      };
      #.legacyPackages.${system};
   in
  {
  	nixosConfigurations.terenix = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {
			inherit inputs;
			#inherit nixvim;
			inherit system;
			inherit nixpkgs;
			inherit pkgs;

			#inherit spicetify-nix;
			inherit pyprland;
			inherit flake-utils;
			overlays = [
			  inputs.hyprpanel.overlay.${system}
			];
		};
		modules = [
			#nixvim.nixosModules.nixvim

			./configuration.nix
			./Modules
		];
	};
  };
}
