local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
require('bufferline').setup{}
require('smoothcursor').setup()
require('config.whichkey').setup()
require('startup').setup({theme = 'evil'})
require('gitsigns').setup()
--require("nvim-tree").setup()
require("todo-comments").setup{}
require('toggleterm').setup({
	direction = 'float',
	close_on_exit = true,
	active = true,
	insert_mappings = true,
	start_in_insert = true,
	terminal_mappings = true,
	open_mapping = [[<c-\>]],
})
require('neo-tree').setup({
	close_if_last_window = true,
	default_component_configs = {
	name = {
		--use_git_status_colors = false,
	},
	git_status = {
		symbols = {
			added = '+',
			modified = '~',
			deleted = 'x',
			renamed = '->',

			untracked = ' ',
			ignored = ' ',
			unstaged = '!',
			staged = ' ',
			conflict = ':(',
		},
	},
},
	window = {
    position = "left",
    width = 30,
	},
	filesystem = {
		use_libuv_file_watcher = true,
	},
})
require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  labeled_modes = 'v',
  multiline = true, 
  opts = {}
}
meow = "a"
	meow = "b"
meow = "a"
  meow = "a"
local chadtree_settings = { ['view.width'] = 31 }
local gradient = {
  '#74d7ec', '#96cde2', '#b9c3d9', '#dcb9d0', '#ffafc7', '#ffafc7', '#fec1d2', '#fdd4de', '#fce6e9', '#fbf9f5', '#fbf9f5', '#fce8ea', '#fdd7e0', '#fec6d5', '#ffb5cb', '#ffb5cb', '#dcbdd2', '#b9c5da', '#96cde2', '#73d5ea'
}

vim.api.nvim_set_var('chadtree_settings', chadtree_settings)
vim.notify = require('notify')
vim.opt.linebreak=false
vim.opt.wrap=false
vim.opt.tabstop=2
vim.opt.termguicolors = true
vim.opt.number = true
vim.cmd('colorscheme oxocarbon')
vim.opt.shiftwidth = 2 
vim.o.undofile = true 
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.opt.expandtab = true
vim.bo.softtabstop = 2 
if vim.fn.has('persistent_undo') == 1 then
  local target_path = vim.fn.expand('~/.undodir')
  if vim.fn.isdirectory(target_path) ~= 1 then
    vim.fn.mkdir(target_path, "p", 0777)
  end

  vim.o.undodir = target_path
  vim.o.undofile = true
end

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

wilder.set_option('renderer', wilder.wildmenu_renderer({
 
 	separator = ' · ',
  left = {' '},
  right = {' ', wilder.wildmenu_index()},
	highlights = {
    gradient = gradient, 
  },
  highlighter = wilder.highlighter_with_gradient({
    wilder.basic_highlighter(), 
  }),
}))
