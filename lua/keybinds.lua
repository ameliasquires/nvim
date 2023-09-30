vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}
vim.keymap.set('n', '<c-k>', '<cmd>:wincmd k<CR>',m_opts)
vim.keymap.set('n', '<c-j>', '<cmd>:wincmd j<CR>',m_opts)
vim.keymap.set('n', '<c-h>', '<cmd>:wincmd h<CR>',m_opts)
vim.keymap.set('n', '<c-l>', '<cmd>:wincmd l<CR>',m_opts)


vim.keymap.set('n', '<S-Tab>', '<cmd>:bnext<CR>',m_opts)
vim.keymap.set('n', '<S-Tab>', '<cmd>:bprev<CR>',m_opts)
vim.keymap.set('n', '<S-q>', '<cmd>:bprev<CR>:bd #<CR>',m_opts)
vim.keymap.set('n', '<c-y>', vim.cmd.UndotreeToggle)


