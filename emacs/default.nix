{ config, pkgs, nixpkgs, ... }: {
  services = {
    emacs = {
      enable = true;
      defaultEditor = true;
      startWithGraphical = true;
     };
  };
  programs = {
    emacs = {
      enable = true;
    };
  };

}
