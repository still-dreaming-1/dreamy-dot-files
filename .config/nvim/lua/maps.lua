vim.keymap.set( -- save
    'n',
    '<leader>s',
    '<Cmd>w<CR>'
)
vim.keymap.set( -- go to smart start of line
    'n',
    '<leader>h',
    '^'
)
vim.keymap.set( -- go to end of line
    {'n', 'o'},
    '<leader>l',
    '$'
)
vim.keymap.set( -- go to end of line
    'x',
    '<leader>l',
    '$h' -- the "h" prevents it from selecting the newline character
)
vim.keymap.set( -- add a space
    'n',
    '<leader>z',
    'i <esc>'
)
vim.keymap.set( -- leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
    'i',
    'kk',
    '<esc><esc>'
)
vim.keymap.set( -- create new line below current line without leaving normal mode or moving cursor
    'n',
    '-',
    'm```o<esc><C-o>'
)
vim.keymap.set( -- create new line above current line without leaving normal mode or moving cursor
    'n',
    '_',
    'm`O<esc>``'
)
vim.keymap.set( -- lua alternative to ":" (enter lua code instead of vimscript)
    'n',
    '<leader>i',
    ':lua '
)

if not vim.g.vscode then -- terminal doesn't work right in VS Code
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
    '<Cmd>noh<Bar>:echo<CR>',
    {
        silent = true,
    }
)
if vim.g.vscode then
    vim.keymap.set( -- show/focus source control/git view
        'n',
        '<leader>g',
        [[<Cmd>call VSCodeNotify('workbench.view.scm')<CR>]]
    )
else
    vim.keymap.set( -- vim-fugitive mappings for git
        'n',
        '<leader>ga',
        '<Cmd>Git add -A<CR>'
    )
    vim.keymap.set( -- git status
        'n',
        '<leader>gs',
        '<Cmd>Git<CR>/modified<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gd',
        '<Cmd>Gdiff<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gc',
        '<Cmd>call DreamyGitCommit()<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gp',
        '<Cmd>Git push<CR>'
    )
    vim.keymap.set(
        'n',
        '<leader>gl',
        '<Cmd>Git! log' --decorate --stat --graph<CR>
    )
    vim.keymap.set( -- vimagit
        'n',
        '<leader>gv',
        '<Cmd>Magit<CR>'
    )
end
if vim.g.vscode then
    vim.keymap.set( -- show/focus terminal
        'n',
        '<leader>T',
        [[<Cmd>call VSCodeNotify('terminal.focus')<CR>]]
    )
else
    vim.keymap.set( -- open a terminal emulator
        'n',
        '<leader>T',
        '<Cmd>te<CR>'
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
if vim.g.vscode then
    vim.keymap.set( -- show/focus the file explorer side panel
        'n',
        '<leader>t',
        [[<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>]]
    )
else
    vim.keymap.set( -- toggle nvim-tree
        'n',
        '<leader>t',
        '<Cmd>NvimTreeFindFileToggle<CR>'
    )
end
if vim.g.vscode then
    vim.keymap.set( -- close current editor file
        'n',
        '<leader>q',
        [[<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>]]
    )
else
    vim.keymap.set( -- quit
        'n',
        '<leader>q',
        '<Cmd>q!<CR>'
    )
end
vim.keymap.set( -- replays the last played macro 3 times
    'n',
    '<leader>@',
    '3@@'
)
-- move after the next dot character (this should be turned into a custom motion where instead of . you can type
-- anything you want to move after. This would be the opposite of t
vim.keymap.set(
    'n',
    '<leader>a.',
    'f.l<esc>'
)
vim.keymap.set( -- make . work with visually selected lines
    'v',
    '.',
    ':norm.<CR>'
)
vim.keymap.set( -- make up and down not ignore wrapping lines
    'n',
    'j',
    'gj'
)
vim.keymap.set(
    'n',
    'k',
    'gk'
)
vim.keymap.set( -- <leader>. will now repeat the last command. Similar to using . to repeat
    'n',
    '<leader>.',
    '@:'
)
vim.keymap.set( -- make backspace delete everything before the cursor until only white space
    'n',
    '<bs>',
    'hv^d'
)
vim.keymap.set( -- use ( to move line up
    'n',
    '(',
    'ddkP'
)
vim.keymap.set( -- use ) to move line down
    'n',
    ')',
    'ddp'
)
if vim.g.vscode then
    vim.keymap.set( -- use Cntrol+Tab to activate the bufexplorer plugin view of the open buffers and move down to the previously opened buffer
        'n',
        '<leader>;',
        [[<Cmd>call VSCodeNotify('workbench.action.showAllEditorsByMostRecentlyUsed')<CR>]]
    )
else
    vim.keymap.set( -- use Cntrol+Tab to activate the bufexplorer plugin view of the open buffers and move down to the previously opened buffer
        'n',
        '<leader>;',
        '<leader>bej',
        { remap = true }
    )
end
