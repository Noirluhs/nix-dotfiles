{ pkgs, ... }:
let
  rust-analyzer = .rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin;
in 
{
  programs = {
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      languages = {
        use-grammars = {
          only = [ "rust" "c" "cpp"];
        };
        language = [{
            name = "rust";
            scope = "source.rust";
            file-types = ["rs"];
            root = ["cargo.toml" "cargo.lock"];
            comment-tokens = [ "//" "/**/" "///"];
            indent = {
              tab-width = 2;
              unit = "  ";
            };
            grammar = [ "rust" ];
            language-server = [ "rust-analyzer"];
        }];
        language-server = {
          rust-analyzer = {
            command = "${rust-analyzer}";
            args = [ "--stdio" ];
            config = {
              check = {
                command = "clippy";
                ignore = ["dead_code" "unused_imports" "unused_variables"];
              };
            };
          };
        };
      };
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
