-- save
vim.keymap.set(
    'n',
    '<leader>s',
    ':w<CR>'
)
-- go to smart start of line
vim.keymap.set(
    'n',
    '<leader>h',
    '^'
)
-- go to end of line
vim.keymap.set(
    {'n', 'x', 'o'},
    '<leader>l',
    '$'
)
-- quit
vim.keymap.set(
    'n',
    '<leader>q',
    ':q<CR>'
)
-- use to add a space
vim.keymap.set(
    'n',
    '<leader>z',
    'i <esc>'
)
-- use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
vim.keymap.set(
    'i',
    'kk',
    '<esc><esc>'
)
-- use - to create new line below current line without leaving normal mode or moving cursor
vim.keymap.set(
    'n',
    '-',
    'm```o<esc><C-o>'
)
-- use _ to create new line above current line without leaving normal mode or moving cursor
vim.keymap.set(
    'n',
    '_',
    'm`O<esc>``'
)
-- lua alternative to :
vim.keymap.set(
    'n',
    '<leader>i',
    ':lua '
)

if not vim.g.vscode then -- terminal doesn't work in VS Code
    -- use kk to return to normal mode from terminal buffer. This also fixes an issue where the cursor would jump to the bottom of the screen after
    -- entering normal mode.
    vim.keymap.set(
        't',
        'kk',
        [[<C-\><C-n>]]
    )
    -- augroup below maps escape for entering normal mode, so this is how you would send the escape key to the terminal
    -- instead of returning to normal mode:
    vim.keymap.set(
        't',
        '<leader><esc>',
        '<esc>'
    )
end
-- pasting in visual mode will yank what you just pasted so it does overwritten by what was pasted over(breaks specifying register, but I don't use them)
vim.keymap.set(
    'x',
    'p',
    'pgvygv<esc>'
)
-- use to unhighlight/unsearch the last search term. You can hit n to re-search/highlight the search term
vim.keymap.set(
    'n',
    '<leader>u',
    ':noh<Bar>:echo<CR>',
    {
        silent = true,
    }
)
if not vim.g.vscode then
    -- vim-fugitive mappings for git
    vim.keymap.set(
        'n',
        '<leader>ga',
        ':Git add -A<CR>'
    )
    -- git status
    vim.keymap.set(
        'n',
        '<leader>gs',
        ':Git<CR>/modified<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gd',
        ':Gdiff<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gc',
        ':call DreamyGitCommit()<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gp',
        ':Git push<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gl',
        ':Git! log' --decorate --stat --graph<CR>
    )
    -- vimagit mapping
    vim.keymap.set(
        'n',
        '<leader>gv',
        ':Magit<CR>'
    )
    -- open Neovim's terminal emulator
    vim.keymap.set(
        'n',
        '<leader>T',
        ':te<CR>'
    )
end
vim.keymap.set(
    'n',
    '<leader>c',
    '<C-v>'
)
vim.keymap.set(
    'n',
    '<Plug>DreamySurroundWithSpaces',
    [[:call Dreamy_surround_cursor_char_with_spaces()<CR>:call repeat#set("\<Plug>DreamySurroundWithSpaces")<CR>]]
)
vim.keymap.set(
    'n',
    '<leader><leader>z',
    '<Plug>DreamySurroundWithSpaces',
    { remap = true }
)
vim.keymap.set(
    'n',
    '<leader><leader>t',
    ':call PsalmTraceVarUnderCursor()<CR>'
)
