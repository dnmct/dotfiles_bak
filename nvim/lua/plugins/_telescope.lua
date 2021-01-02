local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>ff',  ':Telescope find_files<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>fg',  ':Telescope git_files<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>fw',  ':Telescope live_grep<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>fb',  ':Telescope buffers<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>fh',  ':Telescope help_tags<cr>', {noremap = true, silent = true})
