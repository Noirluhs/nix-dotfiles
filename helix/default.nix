{ pkgs, ... }: {
  programs = {
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      settings = {
        theme = "gruvbox";
	editor = {
	  line-number = "relative";
	  lsp = {
	    display-messages = true;
	  };
	  mouse = false;
	  cursor-shape = {
	    insert = "bar";
	    normal = "block";
	    select = "underline";
	  };
	  file-picker = {
	    hidden = false;
	  };
	};
      };
    };
  };
}
