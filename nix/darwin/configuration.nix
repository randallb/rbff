{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  homebrew = {
    enable = true;
    casks = [
      "visual-studio-code"
      "discord"
      "chatgpt"
    ];
  };

  system.primaryUser = builtins.getEnv "USER";

  environment.systemPackages = with pkgs; [
    sapling
  ];

  environment.etc."rbff/active".text = "rbff\n";

  system.stateVersion = 4;
}
