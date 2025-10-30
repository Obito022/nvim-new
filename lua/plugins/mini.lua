return {
  -- Base Mini plugin
  { "echasnovski/mini.nvim", version = false },

  -- Comment plugin
  {
    "echasnovski/mini.comment",
    version = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "BufReadPre",
    config = function()
      -- Disable ts-context-commentstring autocommand
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }

      require("mini.comment").setup {
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring({ key = "commentstring" })
              or vim.bo.commentstring
          end,
        },
      }
    end,
  },

  -- File explorer (Mini Files)
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      { "<leader>ee", function() require("mini.files").open() end, desc = "Toggle mini file explorer" },
      { "<leader>ef", function()
          local mf = require("mini.files")
          mf.open(vim.api.nvim_buf_get_name(0), false)
          mf.reveal_cwd()
        end,
        desc = "Toggle into currently opened file"
      },
    },
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        mappings = {
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "-",
          go_out_plus = "H",
        },
      })
    end,
  },

  -- Surround
  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      custom_surroundings = nil,
      highlight_duration = 300,
      mappings = {
        add = 'sa',
        delete = 'ds',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',
        suffix_last = 'l',
        suffix_next = 'n',
      },
      n_lines = 20,
      respect_selection_type = false,
      search_method = 'cover',
      silent = false,
    },
  },

  -- Remove trailing whitespace
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local miniTrailspace = require("mini.trailspace")
      miniTrailspace.setup({ only_in_normal_buffers = true })

      vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

      vim.api.nvim_create_autocmd("CursorMoved", {
        pattern = "*",
        callback = function() miniTrailspace.unhighlight() end,
      })
    end,
  },

  -- Split & join
  {
    "echasnovski/mini.splitjoin",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local miniSplitJoin = require("mini.splitjoin")
      miniSplitJoin.setup({ mappings = { toggle = "" } }) -- disable default
      vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
      vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
    end,
  },
}

