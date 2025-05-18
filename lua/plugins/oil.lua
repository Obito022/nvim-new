return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Important: Load after UI components
  event = "VeryLazy",
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
      keymaps = {
        ["<C-c>"] = false,
        ["<M-h>"] = "actions.select_split",
        ["<leader>q"] = "actions.close",
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
      float = {
        padding = 2,
        max_width = 80,
      }
    })

    -- Improved keymaps
    vim.keymap.set("n", "-", function()
      require("oil").open()
    end, { desc = "Oil: Open parent directory" })

    vim.keymap.set("n", "<leader>o", function()
      require("oil").toggle_float()
    end, { desc = "Oil: Toggle float" })

    -- Autocmd for clean UI (ADD THIS HERE)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.number = false       -- Disable line numbers
        vim.opt_local.signcolumn = "no"    -- Hide sign column
        vim.opt_local.cursorline = false   -- Disable cursorline (optional)
      end
    })
  end
}
