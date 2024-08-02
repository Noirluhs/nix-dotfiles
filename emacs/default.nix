{ config, pkgs, ... }: 
let
  cfg = config.services.emacs;
in
{  
  options.services = {
    emacs = {
      enable = true;
      defaultEditor = true;
      startWithGraphical = true;
      package = mkPackageOption pkgs "emacs-gtk" { };
    };
  };
  programs = {
    emacs = {
      enable = true;
    };
  };
}
