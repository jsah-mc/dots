require("lualine").setup {
  options = {
    theme = "auto",
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", icon = "", separator = { left = "", right = "" }, left_padding = 1, right_padding = 2 },
    },
    lualine_b = { "filename" },
    lualine_c = 
      "%=", --[[ add your center components here in place of this comment ]]
      {
        "branch",
        icon = "",
        separator = { left = "", right = "" },
        left_padding = 1,
        right_padding = 2,
      }
      "%=",
    },
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = {
      {
        "location",
        separator = { right = "", left = "" },
        left_padding = 0,
        right_padding = 0,
        icon = "󰣇",
      },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}
