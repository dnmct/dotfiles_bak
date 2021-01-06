vim.cmd([[command! -nargs=+ Gca :r!git log -n100 --pretty=format:"\%an <\%ae>" | grep -i '<args>' | head -1 | xargs echo "Co-authored-by:"]])

function Re_add_highlight_groups()
  vim.cmd('highlight LspDiagnosticsDefaultHint guifg=#8FBCBB')
  vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=#5E81AC')
  vim.cmd('highlight LspDiagnosticsDefaultError guifg=#BF616A')
  vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=#EBCB8B')
  -- vim.cmd('highlight LspDiagnosticsSignError guifg=#BF616A')
  -- vim.cmd('highlight LspDiagnosticsSignWarning guifg=#EBCB8B')
  -- vim.cmd('highlight LspDiagnosticsVirtualTextError guifg=#BF616A')
  -- vim.cmd('highlight LspDiagnosticsVirtualTextWarning guifg=#EBCB8B')
end

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end
local autocmds = {
  startup = {
    {"ColorScheme",        "*",      [[lua Re_add_highlight_groups()]]};
  }
}
nvim_create_augroups(autocmds)
