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
      "1password-cli"
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
      "granola"
      "insta360-link-controller"
      "iterm2"
      "linear-linear"
      "loopback"
      "messenger"
      "notion"
      "notion-calendar"
      "obsidian"
      "orbstack"
      "pop-app"
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
     masApps = {
      "1Password for Safari" = 1569813296;
      "Amphetamine" = 937984704;
      "Amazon Kindle" = 302584613;
      "stoic" = 1312926037;
      "WhatsApp" = 310633997;
      "Hush" = 1544743900;
      "Hidden Bar" = 1452453066;
      "Inset - Preview Any Screen Area" = 6759235673;
      "Magnet" = 441258766;
      "OpenIn 4 - Advanced Link Handler" = 1643649331;
      "Pixelmator Pro" = 1289583905;
      "Roam: A Better Remote for Roku" = 6469834197;
      # "Remote Desktop" = 1295203466;
    #   "Screens 5" = 1663047912;
      # "Xcode" = 497799835;
      "Final Cut Pro" = 424389933;
      "Motion" = 434290957;
     };
  };

  system.primaryUser =
    let
      sudoUser = builtins.getEnv "SUDO_USER";
    in
      if sudoUser != "" then sudoUser else builtins.getEnv "USER";
  users.users.root.home = lib.mkForce "/var/root";
  users.users.${config.system.primaryUser}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHooPT7p3a4vhV+hVLWlHUcY/OjoKcLDFOoI7I29GrXo"
  ];

  environment.systemPackages = with pkgs; [
    sapling
    deno
    git
    gh
  ];

  environment.extraInit = ''
    if [ "$TERM" = "xterm-ghostty" ]; then
      ghostty_terminfo="/Applications/Ghostty.app/Contents/Resources/terminfo"
      if [ -d "$ghostty_terminfo" ]; then
        export TERMINFO_DIRS="$ghostty_terminfo:''${TERMINFO_DIRS:-}"
      else
        export TERM="xterm-256color"
      fi
    fi
  '';

  system.defaults.finder = {
    FXPreferredViewStyle = "Nlsv";
    ShowStatusBar = true;
  };

  services.openssh = {
    enable = true;
    extraConfig = ''
      PasswordAuthentication no
      KbdInteractiveAuthentication no
      PermitRootLogin no
    '';
  };

  system.defaults.dock = {
    autohide = true;
    show-recents = false;
    persistent-apps = [
      { app = "/System/Applications/Apps.app"; }
      { app = "/Applications/Ghostty.app"; }
      { app = "/Applications/Google Chrome.app"; }
      { app = "/Applications/Slack.app"; }
      { app = "/Applications/Notion Calendar.app"; }
      { app = "/Applications/Obsidian.app"; }
      { app = "/Applications/Visual Studio Code.app"; }
      { app = "/Applications/ChatGPT.app"; }
      { app = "/Applications/Claude.app"; }
      { app = "/System/Applications/Music.app"; }
      { app = "/Applications/Raycast.app"; }
    ];
    persistent-others = [
      {
        folder = {
          path = "/Users/${config.system.primaryUser}/Downloads";
          displayas = "folder";
          showas = "list";
        };
      }
    ];
  };

  system.defaults.NSGlobalDomain = {
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
  };

  system.defaults.menuExtraClock = {
    IsAnalog = true;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.finder" = {
      StandardViewSettings = {
        ListViewSettings = {
          calculateAllSizes = true;
        };
        ExtendedListViewSettingsV2 = {
          calculateAllSizes = true;
        };
      };
      FK_StandardViewSettings = {
        ListViewSettings = {
          calculateAllSizes = true;
        };
        ExtendedListViewSettingsV2 = {
          calculateAllSizes = true;
        };
      };
    };
  };

  system.activationScripts.postActivation.text = lib.mkAfter (lib.optionalString pkgs.stdenv.hostPlatform.isAarch64 ''
    if ! /usr/sbin/pkgutil --pkg-info com.apple.pkg.RosettaUpdateAuto >/dev/null 2>&1; then
      echo "Installing Rosetta 2..."
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    fi
  '');

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
