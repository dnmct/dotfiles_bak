local U = require('utils')
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

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

U.map('n', 'gh', '<CMD>lua show_docs()<CR>')

-- Use <c-space> to trigger completion.
U.map('i', '<C-SPACE>', 'coc#refresh()', { expr = true })

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
