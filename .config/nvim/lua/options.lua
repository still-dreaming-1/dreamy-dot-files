vim.o.swapfile = false
-- directory specific extra nvim config files
vim.o.exrc = true
-- more secure exrc (see above) mode
vim.o.secure = true
-- I don't completely understand what this does, but it prevents Neovim's terminal buffers from disappearing at random
vim.o.hidden = true
-- at the bottom of the screen show the number of visually selected characters, and other stuff. If the selection is
-- more than one row, shows the row count instead.
vim.o.showcmd = true
-- indentation / tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- use spaces instead of tabs
-- disable folding
vim.o.foldenable = false
vim.o.termguicolors = true
