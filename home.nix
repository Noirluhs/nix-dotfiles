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
      bat
      which
      fzf

      # Privacy
      keepassxc

      # Dev
      http-server
      libresprite

      # Work
      Obsidian


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
	      gita = "git add";
	      gitc = "git commit -m";
	      gitp = "git push";
        gits = "git status";
	      key = "bash ~/.key/pass/.key.sh";
      };
      history = {
        size = 1000;
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
    ./modules/kitty
    ./modules/helix
  ];
}
