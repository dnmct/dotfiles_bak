local U = require('utils')
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api
local g = vim.g

g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-yaml',
    'coc-eslint',
    'coc-prettier',
    'coc-lua',
}

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

U.map('i', '<TAB>', 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true })
U.map('i', '<S-TAB>', 'pumvisible() ? "<C-P>" : "<C-H>"', { expr = true })

function show_docs()
    local cw = fn.expand('<cword>')
    if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        cmd('h '..cw)
    elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
    else
        cmd('!'..vim.o.keywordprg..' '..cw)
    end
end

U.map('n', 'K', '<CMD>lua show_docs()<CR>')

-- Use <c-space> to trigger completion.
U.map('i', '<C-SPACE>', 'coc#refresh()', { expr = true })

-- GoTo code navigation.
U.map('n', '<leader>gd', '<Plug>(coc-definition)', { noremap = false })
U.map('n', '<leader>gy', '<Plug>(coc-type-definition)', { noremap = false })
U.map('n', '<leader>gi', '<Plug>(coc-implementation)', { noremap = false })
U.map('n', '<leader>gr', '<Plug>(coc-references)', { noremap = false })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
U.map('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', { expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
U.map('n', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = false })
U.map('n', ']g', '<Plug>(coc-diagnostic-next)', { noremap = false })

-- Formatting selected code.
U.map('x', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })
U.map('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })
