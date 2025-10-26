{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.nvim.enable = mkEnableOption "Enable Neovim Editor";

  config = mkIf cfg.nvim.enable {
    programs.nvf = {
      enable = true;

      settings = {
        vim = {
          theme = {
            enable = true;
            name = "rose-pine";
            style = "main";
          };

          options = {
            autoindent = true;
            tabstop = 2;
            shiftwidth = 2;
            softtabstop = 2;
            expandtab = true;
          };

          clipboard = {
            enable = true;
            registers = "unnamedplus";
          };

          # UI Modules
          dashboard.alpha = {
            enable = true;
            theme = "dashboard";
          };
          statusline.lualine.enable = true;

          # Autocomplete, syntax, search
          autocomplete.nvim-cmp.enable = true;
          treesitter.enable = true;
          telescope = {
            enable = true;
            mappings = {
              findFiles = "<leader>f";
              liveGrep = "<leader>g";
            };
          };

          # ❌ Consider disabling this if using neo-tree instead
          filetree.nvimTree = {
            enable = true; # changed from true
            # openOnSetup = true;
            mappings.focus = "<leader>e";
          };
          binds = {
            whichKey = {
              enable = true;

              # optional: pass options to which-key setup
              setupOpts = {
                # For example:
                border = "rounded";
                preset = "classic"; # or "modern"
                # any other which-key settings you want
              };

              # optional: register key descriptions
              register = {
                "<leader>e" = "Explorer";
                "<leader>f" = "Find files";
                # add more as needed
              };
            };
          };

          # LSP & diagnostics
          lsp = {
            enable = true;
            mappings.goToDefinition = "<leader>gd";
          };
          diagnostics = {
            enable = true;
            config.virtual_text = true;
          };

          # Languages
          languages = {
            enableFormat = true;
            enableTreesitter = true;
            nix.enable = true;
            python.enable = true;
            clang.enable = true;
            markdown.enable = true;
            go.enable = true;
            bash.enable = true;
            ts.enable = true;
            astro.enable = true;
            css.enable = true;
            csharp = {
              enable = true;
              lsp.enable = true;
              lsp.server = "omnisharp";
            };
          };
        };
      };
    };
  };
}
