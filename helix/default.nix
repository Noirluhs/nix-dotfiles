{ pkgs, ... }: {                                     
  programs = {
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      languages = {
        use-grammars = {
          only = [ "rust" "c" "cpp" ];
        };
        language-server.rust-analyzer = {
            command = "rust-analyzer";
        };
        language = [{
            name = "rust";
            scope = "source.rust";
            injection-regex = "rs|rust";
            file-types = [ "rs" ];
            roots = [ "cargo.toml" "cargo.lock" ];
            shebangs = [ "rust-script" "cargo" ];
            auto-format = true;
            language-server = [ "rust-anazlyzer" ];
            comment-tokens = ["//" "///" "//!"];
        }];
      };
      settings = {
        theme = "gruvbox";
	      editor = {
          mouse = false;
          middle-click-paste = false;
          auto-completion = true;
          auto-format = true;
          completion-timeout = 5;
          preview-completion-insert = true;
          completion-trigger-len = 2;
          completion-replace = true;
	        line-number = "relative";
          statusline = {
            left = ["mode" "spinner"];
            center = ["file-name" "version-control"];
            right = ["position" "file-encoding"];
            separator = "||";
            mode = {
              normal = "normal";
              insert = "insert";
              select = "select";
            };
          };
	        lsp = {
            enable = true;
            snippets = true;
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
