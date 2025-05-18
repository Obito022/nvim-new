-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000, -- Load first
    init = function()
      vim.g.moonflyTransparent = false
      vim.g.moonflyItalics = false
      vim.g.moonflyTerminalColors = true
      vim.g.moonflyWinSeparator = 2
    end,
    config = function()
      local success, _ = pcall(vim.cmd.colorscheme, "moonfly")
      if not success then
        vim.notify("Colorscheme moonfly failed to load", vim.log.levels.ERROR)
        return
      end

      -- Optional tweaks (remove if you want moonfly's default background)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Transparency
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1a1a24" }) -- Popup menu
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#6C6C6C" })  -- Custom line numbers

    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true, -- Lazy-load, as moonfly is default
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        transparent = true, -- Enable transparent background
        italic_comments = true, -- Enable italic comments
        disable_nvimtree_bg = true, -- Disable nvim-tree background color
        color_overrides = {
          vscLineNumber = '#A0A0A0', -- Match line number color
        },
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      -- Load colorscheme only when explicitly called (e.g., :colorscheme vscode)
      -- vim.cmd.colorscheme("vscode") -- Uncomment if you want vscode as default
    end,
  },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
