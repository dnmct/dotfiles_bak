vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'jiangmiao/auto-pairs'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'lifepillar/vim-gruvbox8'
end)
