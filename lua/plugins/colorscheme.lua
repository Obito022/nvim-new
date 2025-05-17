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
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
