{config, pkgs, ... }:

{
  home = {
    username = "test";
    homeDirectory = "/home/test";
    packages = with pkgs; [
      # Utility
      unzip
      zip
      tree
      neofetch

      # Privacy
      keepassxc


    ];
    stateVersion = "24.05";
  };  
  programs = {
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        l = "tree";
        update = "sudo nixos-rebuild switch --flake .";
	update-home = "home-manager switch --flake .";
	cleanup = "sudo nix-collect-garbage -d";
	key = "bash ~/.key/pass/.key.sh";
      };
      history = {
        size = 100;
	path = "${config.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "awesomepanda";
      };
    };
    git = {
      enable = true;
      userName = "Noirluhs";
      userEmail = "noirluhs@hotmail.com";
    };
  };

  imports = [
    ./kitty
    ./tmux
  ];
}