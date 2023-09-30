----]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

if not (vim.fn.getenv("NVIM_DEBUG") == "1") then
	require('speed')
	require('keybinds')
	require('lsp')
	require('opt')
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
	use 'mfussenegger/nvim-jdtls'
	use 'nvim-lua/completion-nvim'
	use 'ziglang/zig.vim'
	use 'p00f/clangd_extensions.nvim'
	use 'nvim-lua/popup.nvim'
	use 'sudormrfbin/cheatsheet.nvim'
	use 'folke/todo-comments.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'nvim-neo-tree/neo-tree.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'jim-fx/sudoku.nvim'
	use 'alanfortlink/blackjack.nvim'
	use 'rktjmp/shenzhen-solitaire.nvim'
	use 'alec-gibson/nvim-tetris'	
	use 'jbyuki/nabla.nvim'
	use 'Eandrju/cellular-automaton.nvim'
	use 'rcarriga/nvim-notify'
	use 'echasnovski/mini.nvim'
	use	'lewis6991/gitsigns.nvim'
	use 'folke/trouble.nvim'
	use 'wuelnerdotexe/vim-enfocado'
	use 'cappyzawa/trim.nvim'
	use 'seandewar/nvimesweeper'
	use 'seandewar/killersheep.nvim'
	use 'nanotech/jellybeans.vim'
	use 'ThePrimeagen/harpoon'
	use 'ray-x/lsp_signature.nvim'
	use 'rktjmp/lush.nvim'
	use 'DNLHC/glance.nvim'
	use 'marko-cerovac/material.nvim'
	use 'Abstract-IDE/Abstract-cs'
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'ggandor/flit.nvim'
	use 'RRethy/nvim-base16'
	use 'lewis6991/impatient.nvim'
	use 'danilamihailov/beacon.nvim'	
	use 'tiagovla/tokyodark.nvim'
	use 'cpea2506/one_monokai.nvim'
	use 'ramojus/mellifluous.nvim'
	use 'olivercederborg/poimandres.nvim' 
	use 'RRethy/vim-illuminate'
	use 'EdenEast/nightfox.nvim'
	use 'frenzyexists/aquarium-vim'
	use 'kdheepak/monochrome.nvim'
	use 'junegunn/fzf'
	use 'ray-x/aurora' 
	use 'crusoexia/vim-monokai'
	use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim' 
  use 'williamboman/mason.nvim' 
  use 'williamboman/mason-lspconfig.nvim'
  use 'mfussenegger/nvim-dap'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'farmergreg/vim-lastplace' 
  use {'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons'}
  use 'gen740/SmoothCursor.nvim' 
  use 'gennaro-tedesco/nvim-peekup'
  use 'gelguy/wilder.nvim' 
  use 'bluz71/vim-nightfly-colors'
	use 'catppuccin/nvim'
	use 'nyoom-engineering/oxocarbon.nvim'
	use 'folke/which-key.nvim' 
	use 'mbbill/undotree'
	use 'startup-nvim/startup.nvim'
	use 'jiangmiao/auto-pairs'
	use 'nvim-treesitter/nvim-treesitter'
	use 'akinsho/toggleterm.nvim'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end) 


