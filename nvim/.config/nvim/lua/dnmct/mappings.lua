-- TELESCOPE maps  --
-- open available commands & run it
vim.api.nvim_set_keymap('n', ',c',
                        [[<Cmd>lua require'telescope.builtin'.commands()<CR>]],
                        {noremap = true, silent = true})
-- show LSP diagnostics for all open buffers
vim.api.nvim_set_keymap('n', '<Leader>d',
                        [[<Cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>]],
                        {noremap = true, silent = true})
-- commands - Lua API in the works: https://github.com/neovim/neovim/pull/12378
-- git_branches
vim.api.nvim_set_keymap('n', '<leader>gc',
                        [[<Cmd>lua require'telescope.builtin'.git_branches()<CR>]],
                        {noremap = true, silent = true})
-- Telescope oldfiles
vim.api.nvim_set_keymap('n', '<space>o',
                        [[<Cmd>lua require'telescope.builtin'.oldfiles()<CR>]],
                        {noremap = true, silent = true})
-- live grep slowness: https://github.com/nvim-telescope/telesope.nvim/issues/392
vim.api.nvim_set_keymap('n', ',g',
                        [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ',k',
                        [[<Cmd>lua require'telescope.builtin'.keymaps()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ',b',
                        [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ',h',
                        [[<Cmd>lua require'telescope.builtin'.help_tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fm',
                        [[<Cmd>lua require'telescope.builtin'.marks()<CR>]],
                        {noremap = true, silent = true})
-- grep word under cursor
vim.api.nvim_set_keymap('n', '<leader>g',
                        [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]],
                        {noremap = true, silent = true})

-- open file in directory of current file
vim.api.nvim_set_keymap('n', '<leader>e', ':e %:h/',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>v', ':vs %:h/',
                        {noremap = false, silent = false})

-- open quickfix / close
vim.api.nvim_set_keymap('n', '<leader>co', ':cope<cr>',
                        {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cl', ':cclose<cr>',
                        {noremap = false, silent = true})
-- open location list - close manually
vim.api.nvim_set_keymap('n', '<leader>lo', ':lope<cr>',
                        {noremap = false, silent = true})
