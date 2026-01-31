{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.zsh.enable = true;
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.deno/bin"
    "/opt/homebrew/bin"
    "/usr/local/bin"
  ];
  home.stateVersion = "24.05";
}
