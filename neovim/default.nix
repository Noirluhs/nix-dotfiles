{ inputs, ... } {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./keymappings.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    preformance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "nvim-treesitter"
        ];
      };
      byteCompliation.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    lualoader.enable = true;
  }
}
