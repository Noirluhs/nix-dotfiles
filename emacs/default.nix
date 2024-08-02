{ pkgs, ... }: 
let
  cfg = config.services.emacs;
in
{  
  options.services = {
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
