return {
  { import = "plugins.colorscheme"  }, -- First (visual setup)
  { import = "plugins.treesitter"   }, -- Early (syntax)
  { import = "plugins.lualine"      }, -- UI component
  { import = "plugins.oil"          }, -- File explorer (loads last)
  { import = "plugins.auto-pairs"   }, -- Autopairs (InsertEnter)
  { import = "plugins.snacks"       }, -- Snacks (ASCII etc.)
  { import = "plugins.mini"         }, -- Mini-file Explorer
  { import = "plugins.todo-comments"},


  -- Add this to disable netrw completely
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  }
}
