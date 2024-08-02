{ pkgs, ... }: {
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      extraConfig = "
        (setq inhibit-startup-message t)
	(setq visible-bell t)
	(menu-bar-mode -1)
	(tool-bar-mode -1)
	(scroll-bar-mode -1)
      ";
    };
  };
}
