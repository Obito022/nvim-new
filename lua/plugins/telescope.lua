return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- or '0.1.x' for stable
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "andrew-george/telescope-themes",
  },
  -- Lazy-load on these keypresses
  keys = {
    { "<leader>pr", "<cmd>Telescope oldfiles<CR>", desc = "Fuzzy find recent files" },
    { "<leader>pWs", function()
        require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
      end, desc = "Find word under cursor" },
    { "<leader>ths", "<cmd>Telescope themes<CR>", desc = "Theme Switcher" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Load extensions
    telescope.load_extension("fzf")
    telescope.load_extension("themes")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        themes = {
          enable_previewer = true,
          enable_live_preview = true,
          persist = {
            enabled = true,
            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
          },
        },
      },
    })
  end,
}

