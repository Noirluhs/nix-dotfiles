{ pkgs, ... }: {
  programs = {
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      settings = {
        theme = "gruvbox";
	      editor = {
          mouse = true;
          middle-click-paste = true;
          auto-completion = true;
          auto-format = true;
          completion-timeout = 5;
          preview-completion-insert = true;
          completion-trigger-len = 3;
          completion-replace = true;
	        line-number = "relative";
	        lsp = {
	          display-messages = true;
	        };
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
