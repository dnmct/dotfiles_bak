vim.cmd('packadd packer.nvim')

local packer = require('packer')
local use = packer.use

return packer.startup(function()

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}

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
  -- use 'arcticicestudio/nord-vim'
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Tree-Sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'mhinz/vim-signify'
  use 'jiangmiao/auto-pairs'
  use {'neoclide/coc.nvim', branch = 'release'}
--  use 'junegunn/fzf'
--  use 'junegunn/fzf.vim'
end)
