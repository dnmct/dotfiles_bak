vim.cmd('packadd packer.nvim')

local packer = require('packer')
local use = packer.use

return packer.startup(function()

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}
  
  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Tpope Plugins
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Theme
  use 'arcticicestudio/nord-vim'
  use {'dracula/vim', as = 'dracula'}

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Tree-Sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- File Manager
  -- use 'kyazdani42/nvim-tree.lua'

  use 'mhinz/vim-signify'
  use 'jiangmiao/auto-pairs'
--  use 'junegunn/fzf'
--  use 'junegunn/fzf.vim'
end)
