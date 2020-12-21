local U = {}

function U.map(mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    noremap = true,
    silent = true,
    expr = false
  })

  vim.fn.nvim_set_keymap(mode, key, result, opts)
end

return U
