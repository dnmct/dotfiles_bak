local U = require 'utils'
local vim = vim

vim.g.fzf_layout = { down = '~40%' }

U.map("n", "<leader>ff", ':Files<CR>')

U.map("n", "<leader>fg", ':GFiles<CR>')

-- b = buffers
U.map("n", "<leader>fb", ':Buffers<CR>')

-- i = history
U.map("n", "<leader>fh", ':History<CR>')
