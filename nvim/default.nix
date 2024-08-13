{ pkgs, ... } {
  programs = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-gtk;
    plugins = with pkgs.vimPlugins; [
      telescope
    ];
  }
