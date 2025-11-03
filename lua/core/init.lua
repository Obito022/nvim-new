--  ~/.config/nvim/lua/core

-- Force Neovim and Mason to use Homebrew Python 3.12 (required for pylint >= 3.10)
vim.g.python3_host_prog = "/opt/homebrew/opt/python@3.12/bin/python3"

require("core.options")     -- vim.opt settings
require("core.keymaps")     -- key mappings
