return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" }, -- Loads when opening files
    build = ":TSUpdate",                    -- Auto-update parsers on install
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Core Features
        highlight = {
          enable = true,                    -- Basic syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable slow regex highlights
        },
        indent = { enable = true },         -- Smart indentation
        
        -- Language Parsers (Added Haskell)
        ensure_installed = {
          "bash", "c", "css", "dockerfile",
          "gitignore", "go", "graphql", "haskell", -- Added Haskell here
          "html", "http", "java", "javascript",
          "json", "lua", "markdown", "markdown_inline",
          "prisma", "python", "query", "rust",
          "svelte", "tsx", "typescript", "vim",
          "vimdoc", "yaml"
        },
        
        -- Advanced Features
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",    -- Start selection mode
            node_incremental = "<C-space>",  -- Expand selection
            scope_incremental = false        -- Disable scope selection
          },
        },
        
        -- Performance Tuning
        auto_install = true,               -- Auto-install missing parsers
        ignore_install = {},                -- No parsers to ignore
      })
    end,
  },
  
  {
    "windwp/nvim-ts-autotag",
    ft = {                                  -- Only load for these filetypes
      "html", "xml", "javascript", 
      "typescript", "javascriptreact", 
      "typescriptreact", "svelte"
    },
    config = function()
      require("nvim-ts-autotag").setup({
        -- Global Settings
        enable_close = true,               -- Auto-close tags
        enable_rename = true,              -- Auto-rename paired tags
        enable_close_on_slash = false,     -- Disable auto-closing on /
        
        -- Filetype-Specific Overrides
        per_filetype = {
          html = { enable_close = true },  -- HTML-specific settings
          typescriptreact = { enable_close = true }
        }
      })
    end,
  }
}
