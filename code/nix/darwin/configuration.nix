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
      "1password"
      "aqua-voice"
      "ableton-live-suite"
      "audio-hijack"
      "beeper"
      "betterdisplay"
      "chatgpt"
      "claude"
      "deskpad"
      "discord"
      "elgato-stream-deck"
      "epic-games"
      "figma"
      "ghostty"
      "google-chrome"
      "google-drive"
      "iterm2"
      "linear-linear"
      "loopback"
      "messenger"
      "notion"
      "notion-calendar"
      "obsidian"
      "orbstack"
      "pop"
      "raycast"
      "replit"
      "screen-studio"
      "screens-connect"
      "shortwave"
      "slack"
      "typefully"
      "typora"
      "virtualdj"
      "visual-studio-code"
      "waves-central"
      "zoom"
    ];
    # masApps = {
    #   "1Password for Safari" = 1569813296;
    #   "Amazon Kindle" = 302584613;
    #   "Final Cut Pro" = 424389933;
    #   "Hush" = 1544743900;
    #   "Magnet" = 441258766;
    #   "Motion" = 434290957;
    #   "OpenIn" = 6520390762;
    #   "Pixelmator Pro" = 1289583905;
    #   # "Remote Desktop" = 1295203466;
    #   "Screens 5" = 1663047912;
    #   "WhatsApp" = 310633997;
    #   "Xcode" = 497799835;
    #   "stoic" = 1312926037;
    # };
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

  home-manager.backupFileExtension = "hm-bak";

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
