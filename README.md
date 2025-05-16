# 🛠️ My Neovim Config

Welcome to my personal Neovim configuration! This setup is tailored for
[programming/writing/general use] and is optimized for performance, simplicity,
and productivity.

```bash
~/.config/nvim/
├── init.lua                  -- Main entry point
├── lua/
│   ├── core/                 -- Basic settings (from your abir/ folder)
│   │   ├── init.lua          -- Core initialization
│   │   ├── options.lua       -- (your set.lua)
│   │   ├── keymaps.lua       -- (your remap.lua)
│   │   └── autocmds.lua      -- New file for autocommands
│   ├── plugins/
│   │   ├── init.lua          -- Lazy.nvim setup (bootstrap + basic config)
│   │   ├── lazy.lua          -- Plugin declarations (specs+individual configs)
│   │   └── colorscheme.lua   -- (your colors.lua)
│   └── configs/              -- Language/server configs
│       ├── lsp.lua
│       ├── null-ls.lua
│       └── treesitter.lua    -- (moved from after/plugin)
├── after/
│   └── plugin/               -- Your existing plugin overrides
│       ├── devicons.lua      -- Kept in after/plugin
│       ├─ lualine.lua       -- Kept in after/plugin
│       └── telescope.lua     -- Kept in after/plugin
└── plugin/
    └── packer_compiled.lua   -- Your existing compiled file
