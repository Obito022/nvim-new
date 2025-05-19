vim.g.mapleader = " "

-- To map jj in insert mode to <Esc>
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Visual mode line movement
-- Moves selected lines up/down while maintaining:
-- 1. Visual selection
-- 2. Proper indentation
-- 3. Cursor position relative to moved text

-- Move selected lines down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move selected line(s) down (visual mode)",
  silent = true  -- Suppress command echo
})

-- Move selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move selected line(s) up (visual mode)",
  silent = true
})

vim.api.nvim_set_keymap('i', '{<Tab>', '{<CR>}<Esc>O', { 
  noremap = true,     -- {
  silent = true       --     | (cursor here)
})                    -- }
