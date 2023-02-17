local opt = { noremap = true }
-- save
vim.api.nvim_set_keymap(
    'n',
    '<leader>s',
    ':w<CR>',
    opt
)
-- go to smart start of line
vim.api.nvim_set_keymap(
    'n',
    '<leader>h',
    '^',
    opt
)
-- go to end of line
vim.api.nvim_set_keymap(
    'n',
    '<leader>l',
    '$',
    opt
)
vim.api.nvim_set_keymap(
    'x',
    '<leader>l',
    '$',
    opt
)
vim.api.nvim_set_keymap(
    'o',
    '<leader>l',
    '$',
    opt
)
-- quit
vim.api.nvim_set_keymap(
    'n',
    '<leader>q',
    ':q<CR>',
    opt
)
-- use to add a space
vim.api.nvim_set_keymap(
    'n',
    '<leader>z',
    'i <esc>',
    opt
)
-- use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
vim.api.nvim_set_keymap(
    'i',
    'kk',
    '<esc><esc>',
    opt
)
-- use - to create new line below current line without leaving normal mode or moving cursor
vim.api.nvim_set_keymap(
    'n',
    '-',
    'm```o<esc><C-o>',
    opt
)
-- use _ to create new line above current line without leaving normal mode or moving cursor
vim.api.nvim_set_keymap(
    'n',
    '_',
    'm`O<esc>``',
    opt
)
-- lua alternative to :
vim.api.nvim_set_keymap(
    'n',
    '<leader>i',
    ':lua ',
    opt
)
