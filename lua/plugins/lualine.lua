return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- For file icons
    event = "VeryLazy", -- Load after most plugins
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- To configure lazy pending updates count

      local mode = {
        'mode',
        fmt = function(str)
          return ' ' .. str
        end,
      }

      local diff = {
        'diff',
        colored = true,
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      }

      local filename = {
        'filename',
        file_status = true,
        path = 0,
      }

      local branch = { 'branch', icon = { '', color = { fg = '#A6D4DE' } }, '|' }

      lualine.setup({
        options = {
          theme = "auto",  -- Dynamically match current colorscheme
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "|", right = "" },
          icons_enabled = true,
          globalstatus = true, -- Single statusline for all windows
          disabled_filetypes = { statusline = {}, winbar = {} },
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch },
          lualine_c = { diff, filename },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            { "filetype" },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "nvim-tree", "lazy" },
      })
    end,
  },
}
