{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  homebrew = {
    enable = true;
    user = config.system.primaryUser;
    casks = [
      "visual-studio-code"
      "discord"
      "chatgpt"
    ];
  };

  system.primaryUser =
    let
      sudoUser = builtins.getEnv "SUDO_USER";
    in
      if sudoUser != "" then sudoUser else builtins.getEnv "USER";
  users.users.root.home = lib.mkForce "/var/root";

  environment.systemPackages = with pkgs; [
    sapling
    codex
  ];

  environment.etc."rbff/active".text = "rbff\n";

  programs.zsh = {
    enable = true;
    loginShellInit = ''
      if [ -f /etc/profiles/per-user/${config.system.primaryUser}/etc/profile.d/hm-session-vars.sh ]; then
        source /etc/profiles/per-user/${config.system.primaryUser}/etc/profile.d/hm-session-vars.sh
      fi
    '';
  };

  documentation = {
    enable = false;
    man.enable = false;
    info.enable = false;
    doc.enable = false;
  };

  system.stateVersion = 4;
}
