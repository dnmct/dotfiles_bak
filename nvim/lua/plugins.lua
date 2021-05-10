local execute = vim.api.nvim_command
local fn = vim.fn
local use = require('packer').use

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- let packer manage itself
  use {
    'kyazdani42/nvim-tree.lua',
    require = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-compe',
    requires = {
      { 'hrsh7th/vim-vsnip' },
      { 'hrsh7th/vim-vsnip-integ' }
    }
  }
  use 'terrortylor/nvim-comment'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
      'glepnir/galaxyline.nvim', branch = 'main',
      requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'kevinhwang91/nvim-bqf'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'glepnir/zephyr-nvim'
  use 'rescript-lang/vim-rescript'
end)
