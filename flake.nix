{
  description = "Home Manager configuration of janandersson";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      # nixpkgs.config = {
      #   allowUnfree = true;
      #   allowUnfreePredicate = (_: true);
      # };
      homeConfigurations."janandersson" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./git.nix
          ./home.nix
          ./starship.nix
          ./vim.nix
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
