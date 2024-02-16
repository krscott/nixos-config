{ pkgs, shellAliases }:
{
  # https://nixos.wiki/wiki/Zsh
  inherit shellAliases;
  enable = true;
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-dotfile";
      src = ./.;
      file = "p10k.zsh";
    }
    {
      name = "autosuggestions";
      src = pkgs.zsh-autosuggestions;
      file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    }
    {
      name = "syntax-highlighting";
      src = pkgs.zsh-syntax-highlighting;
      file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    }
    {
      name = "history-substring-search";
      src = pkgs.zsh-history-substring-search;
      file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
    }
    {
      name = "you-should-use";
      src = pkgs.zsh-you-should-use;
      file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
    }
  ];
  initExtra = ''
    # zsh-history-substring-search
    bindkey '^[[A' history-substring-search-up
    bindkey '^[OA' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^[OB' history-substring-search-down
  '';
}
