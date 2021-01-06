local lsp = require('lspconfig')
local completion = require('completion')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", { noremap = true, silent = true })
end

local custom_attach = function()
  completion.on_attach()
  -- Move cursor to the next and previous diagnosic
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
  mapper('n','gD','vim.lsp.buf.declaration()')
	mapper('n','<leader>gd','vim.lsp.buf.definition()')
	mapper('n','K','vim.lsp.buf.hover()')
	mapper('n','<leader>gr','vim.lsp.buf.references()')
	mapper('n','<leader>gs','vim.lsp.buf.signature_help()')
	mapper('n','<leader>gi','vim.lsp.buf.implementation()')
	mapper('n','<leader>gt','vim.lsp.buf.type_definition()')
	mapper('n','<leader>gw','vim.lsp.buf.document_symbol()')
	mapper('n','<leader>gW','vim.lsp.buf.workspace_symbol()')
	mapper('n','<leader>af','vim.lsp.buf.code_action()')
	mapper('n','<leader>ar','vim.lsp.buf.rename()')
	mapper('n','<leader>ee','vim.lsp.diagnostic.show_line_diagnostics()')
	mapper('n','<leader>=', 'vim.lsp.buf.formatting()')
	mapper('n','<leader>ai','vim.lsp.buf.incoming_calls()')
	mapper('n','<leader>ao','vim.lsp.buf.outgoing_calls()')
end

lsp.tsserver.setup{
  on_attach = custom_attach
}

-- lsp.diagnosticls.setup{
--   init_options = {
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     linters = {
--       eslint = {
--         sourceName = 'eslint',
--         command = './node_modules/.bin/eslint',
--         rootPatterns = { '.git' },
--       }
--     }
--   }
-- }

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.expand('$HOME/lsp/lua-language-server')
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach = custom_attach;
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "<C-n>" : "<Tab>"]], {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<Tab>"]], {expr = true})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
