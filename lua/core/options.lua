--  Disable Netrw's help banner for a cleaner file explorer
vim.cmd("let g:netrw_banner = 0 ")

local opt = vim.opt  -- shorthand

opt.guicursor = ""             -- Disable all cursor shape changes

-- UI
opt.syntax = "enable"         -- Force syntax highlighting
opt.number = true              -- show line numbers
opt.relativenumber = true      -- relative line numbers
--opt.ruler = true               -- show cursor position
opt.laststatus = 3             -- always show statusline
opt.showmode = false           -- don't show -- INSERT -- in command line
opt.cursorline = true         -- highlight current line

-- Search
opt.hlsearch = true            -- highlight search matches
opt.incsearch = true           -- incremental search
opt.ignorecase = true          -- ignore case when searching...
opt.smartcase = true           -- ...unless there's a capital letter

-- Indentation
opt.autoindent = true          -- maintain indent from previous line
opt.smartindent = true         -- smarter autoindent
opt.tabstop = 2                -- tabs = 2 spaces
opt.softtabstop = 2                -- tabs = 2 spaces
opt.shiftwidth = 2             -- indentation width
opt.expandtab = true           -- use spaces instead of tabs

-- Encoding
opt.encoding = "utf-8"         -- default encoding
opt.fileencoding = "utf-8"     -- file encoding

-- Behavior
opt.belloff = "all"            -- disable all bells
opt.wrap = false               -- don't wrap lines
opt.scrolloff = 8              -- keep cursor 8 lines from screen edge
opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"     -- Always show sign column (left gutter)

-- File
opt.swapfile = false
opt.backup = false
opt.undofile = true            -- enable persistent undo

-- Performance
opt.updatetime = 300           -- faster completion
opt.timeoutlen = 500           -- faster key sequences

opt.mouse = "a"                -- for easy mouse resizing, just incase

-- backspace
opt.backspace = { "start", "eol", "indent" }

--split windows
opt.splitright = true         --split vertical window to the right
opt.splitbelow = true         --split horizontal window to the bottom

vim.g.editorconfig = true     -- gets rid of line with white spaces

vim.opt.termguicolors = true
opt.background = "dark"       -- Force dark mode
