return {
  { import = "plugins.colorscheme" },  -- First (visual setup)
  { import = "plugins.treesitter"  }, -- Early (syntax)
  { import = "plugins.lualine"     }, -- UI component
  { import = "plugins.oil"         }, -- File explorer (loads last)
  -- Add this to disable netrw completely
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  }
}
