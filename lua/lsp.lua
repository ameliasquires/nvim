require('mason').setup()
--require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.eslint.setup{}
lspconfig.clangd.setup{
    capabilities = { offsetEncoding = 'utf-8' }, -- = capabilities
}
lspconfig.zls.setup {}
lspconfig.lua_ls.setup {}
--[[
require('clangd_extensions').setup{
	server = {
	  capabilities = { offsetEncoding = 'utf-8' }, -- = capabilities	
	},
	extensions = {
		inlay_hints = {
			show_parameter_hints = false,
		},
	},
}
--]]
local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
				--null_ls.builtins.diagnostics.codespell,
   			--null_ls.builtins.diagnostics.clang_check, 
		},
})

require('illuminate').configure({ 
    providers = {
        'lsp',
        'treesitter',
        'regex',
    }, 
    delay = 100,
    filetype_overrides = {}, 
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    filetypes_allowlist = {}, 
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 'c', 'lua', 'cpp', 'python', 'java', 'javascript'},
 
  sync_install = false,

  auto_install = true,
	
	highlight = {
    enable = true,

   	disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  	additional_vim_regex_highlighting = false,
  
	},
	rainbow = {
		enable = true,
		extented_mod = true,
		colors = {
  		'#74d7ec', '#96cde2', '#b9c3d9', '#dcb9d0', '#ffafc7', '#ffafc7', '#fec1d2', '#fdd4de', '#fce6e9', '#fbf9f5', '#fbf9f5', '#fce8ea', '#fdd7e0', '#fec6d5', '#ffb5cb', '#ffb5cb', '#dcbdd2', '#b9c5da', '#96cde2', '#73d5ea'
		},
	},
}
local cmp = require'cmp'

  cmp.setup({
		--[[
		sorting = {
			comparators = {
				require('clangd_extensions.cmp_scores'),
			},
		},
		--]]
		snippet = { 
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }), 
		}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })



require 'lsp_signature'.setup()
