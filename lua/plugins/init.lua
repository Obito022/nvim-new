-- ~/.config/nvim/lua/plugins/init.lua

-- Auto-install Lazy.nvim
-- Get the full path to where Lazy.nvim should be installed
-- stdpath("data") returns Neovim's data directory 
-- ( ~/.local/share/nvim on Linux )
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if Lazy.nvim is already installed
-- vim.loop.fs_stat() is Neovim's async filesystem check
if not vim.loop.fs_stat(lazypath) then
  -- If not installed, clone the repository
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add Lazy.nvim to Neovim's runtimepath
-- prepend() ensures it loads before other plugins
vim.opt.rtp:prepend(lazypath)

-- Initialize with lazy.lua specs
require("lazy").setup("plugins.lazy", {
  defaults = { lazy = true },
  checker = { enabled = false }
})
