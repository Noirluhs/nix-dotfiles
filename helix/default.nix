{ pkgs, ... }: {
  programs = {
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      settings = {
        theme = "gruvbox"

	[editor]
	line-number = "relative"
	mouse = false

	[editor.cursor-shape]
	insert = "bar"
	normal = "block"
	select = "underline"

	[editor.file-picker]
	hidden = false
      };
    };
  };
}
