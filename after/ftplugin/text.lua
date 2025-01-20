-- Don't show a new indentation on wrap
vim.opt.breakindent = false

-- Navigate with j and k on wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
