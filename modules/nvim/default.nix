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
  options.modules.nvim.enable = mkEnableOption "Enable Neovim IDE setup";

  config = mkIf cfg.nvim.enable {
    programs.nixvim = {
      enable = true;

      extraConfigLuaPre = ''
        vim.g.mapleader = " "
        vim.g.maplocalleader = "\\"
      '';

      colorschemes.tokyonight = {
        enable = true;
        settings = {
          style = "night";
          transparent = true;
        };
      };

      plugins = {
        lualine = { enable = true; };
        bufferline = { enable = true; };
        dashboard = { enable = true; };
        "which-key" = {
          enable = true;
          settings = {
            window = { border = "rounded"; };
            layout = { align = "center"; };
          };
        };
        neo-tree = {
          enable = true;
          settings = {
            filesystem.filteredItems = {
              hideDotfiles = false;
              hideGitignored = true;
            };
          };
        };
        telescope = {
          enable = true;
          settings.defaults = {
            layout_strategy = "flex";
            sorting_strategy = "ascending";
          };
        };
        lsp = {
          enable = true;
          servers = {
            lua_ls.enable = true;
            nixd.enable = true;
            pyright.enable = true;
            ts_ls.enable = true;
            rust_analyzer.enable = true;
            astro.enable = true;
          };
        };
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            snippet.expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
            mappingPreset = "default";
            sources = [
              { name = "nvim_lsp"; }
              { name = "buffer"; }
              { name = "path"; }
              { name = "luasnip"; }
            ];
          };
        };
        luasnip = { enable = true; };
        "nvim-autopairs" = { enable = true; };
        snacks = {
          enable = true;
          settings = {
            explorer = { enabled = true; };
            picker   = { enabled = true; sources = { explorer = {}; }; };
          };
        };
        noice = { enable = true; };

        # Proper comment.nvim module
        comment = { enable = true; };
      };

      keymaps = [
        # Telescope
        { mode = "n"; key = "<leader>f";  action = "<nop>"; options.desc = "󰱼 Find (Telescope)"; }
        { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<CR>"; options.desc = "Find files"; }
        { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<CR>";  options.desc = "Live grep"; }
        { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<CR>";    options.desc = "Find buffer"; }

        # File / Explorer
        { mode = "n"; key = "<leader>fs"; action = "<cmd>w<CR>"; options.desc = "Save file"; }
        { mode = "n"; key = "<leader>qq"; action = "<cmd>qall<CR>"; options.desc = "Quit all"; }
        { mode = "n"; key = "<leader>e";  action = "<cmd>lua require('snacks').picker.explorer()<CR>"; options.desc = "Explorer (Snacks)"; }

        # LSP
        { mode = "n"; key = "<leader>l";  action = "<nop>"; options.desc = "󰄾 LSP"; }
        { mode = "n"; key = "gd";        action = "<cmd>lua vim.lsp.buf.definition()<CR>"; options.desc = "Go to definition"; }
        { mode = "n"; key = "K";         action = "<cmd>lua vim.lsp.buf.hover()<CR>"; options.desc = "Hover docs"; }
        { mode = "n"; key = "<leader>lr";action = "<cmd>lua vim.lsp.buf.rename()<CR>"; options.desc = "Rename symbol"; }
        { mode = "n"; key = "<leader>la";action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; options.desc = "Code action"; }

        # Bufferline
        { mode = "n"; key = "<leader>b";  action = "<nop>"; options.desc = "󰈔 Buffers"; }
        { mode = "n"; key = "<leader>bn";action = "<cmd>BufferLineCycleNext<CR>"; options.desc = "Next buffer"; }
        { mode = "n"; key = "<leader>bp";action = "<cmd>BufferLinePick<CR>"; options.desc = "Pick buffer"; }
        { mode = "n"; key = "<leader>bc";action = "<cmd>BufferLinePickClose<CR>"; options.desc = "Pick & close buffer"; }

        # Comment.nvim keymaps
        { mode = "n"; key = "<leader>/"; action = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>"; options.desc = "Toggle comment"; }
        { mode = "v"; key = "<leader>/"; action = "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"; options.desc = "Toggle comment (visual)"; }
      ];

      opts = {
        number         = true;
        relativenumber = true;
        mouse          = "a";
        shiftwidth     = 2;
        tabstop        = 2;
        expandtab      = true;
        smartindent    = true;
        termguicolors  = true;
      };

      extraConfigLuaPost = ''
        -- Lualine pill style
        require("lualine").setup {
          options = { theme = "auto", component_separators = "", section_separators = { left = "", right = "" } },
          sections = {
            lualine_a = { { "mode", icon = "", separator = { left = "", right = "" }, left_padding = 1, right_padding = 2 } },
            lualine_b = { "filename" },
            lualine_c = { "%=", { "branch", icon = "", separator = { left = "", right = "" }, left_padding = 1, right_padding = 2 }, "%=" },
            lualine_x = {}, lualine_y = { "filetype" },
            lualine_z = { { "location", separator = { right = "", left = "" }, left_padding = 0, right_padding = 0, icon = "" } },
          },
          inactive_sections = { lualine_a = { "filename" }, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = { "location" } },
          tabline = {}, extensions = {},
        }

        -- Bufferline pill style
        require("bufferline").setup { options = { numbers="ordinal", close_command="bdelete %d", left_mouse_command="buffer %d", right_mouse_command="bdelete %d", indicator={icon=" ",style="icon"}, buffer_close_icon="", show_buffer_close_icons=true, show_close_icon=false, show_tab_indicators=true, separator_style="", offsets={{filetype="NvimTree",text="",padding=1}}, always_show_bufferline=true }, highlights = { fill={guibg="NONE"}, background={guibg="#1f1f2e"}, buffer_selected={guibg="#2d2a55", gui="bold"}, tab_selected={guibg="#2d2a55"}, close_button={guibg="#2d2a55"} } }

        -- Noice with floating cmdline
        require("noice").setup { cmdline={enabled=true,float={border="rounded"}}, popupmenu={enabled=true,backend="nui",max_width=80,min_width=40}, messages={enabled=true,view="mini"} }
      '';
    };
  };
}

