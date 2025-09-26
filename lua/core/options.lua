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
opt.showmode = true           -- don't show -- INSERT -- in command line
opt.cursorline = false         -- highlight current line

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

-- Set transparent background for all relevant groups
local function set_transparent()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

  -- Custom search highlight
  vim.api.nvim_set_hl(0, "Search", { fg = "#000000", bg = "#ffff00" })
  vim.api.nvim_set_hl(0, "Underlined", { underline = false })
end

-- Apply when colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparent,
})

-- Optional: Apply immediately for faster feedback
set_transparent()

-- Restore cursor to the last known position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
