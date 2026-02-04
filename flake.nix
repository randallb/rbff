{
  description = "rbff: minimal macOS setup via nix-darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager }:
    let
      system =
        if builtins ? currentSystem then
          builtins.currentSystem
        else
          let envSystem = builtins.getEnv "NIX_SYSTEM";
          in if envSystem != "" then envSystem else "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      username =
        let
          sudoUser = builtins.getEnv "SUDO_USER";
        in
          if sudoUser != "" then sudoUser else builtins.getEnv "USER";
    in {
      darwinConfigurations.rbff = darwin.lib.darwinSystem {
        inherit system pkgs;
        modules = [
          ./code/nix/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            users.users.${username}.home = "/Users/${username}";
            home-manager.users.${username} = {
              home.username = username;
              imports = [ ./code/nix/home-manager/home.nix ];
            };
          }
        ];
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.deno
        ];
      };
    };
}
