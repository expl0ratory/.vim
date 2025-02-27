require("config.lazy")

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
--hi clear SignColumn

vim.opt.compatible = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'utf-8'
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.synmaxcol = 200
vim.opt.wrap = false
vim.opt.ttimeoutlen = 100
vim.opt.number = true
vim.opt.completeopt = 'menu,menuone,noinsert,noselect'
vim.opt.showmode = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.linespace = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.cindent = true
--vim.opt.backup = false
--vim.opt.writebackup = false
--vim.opt.noswapfile 
vim.opt.foldmethod = 'syntax'
--vim.opt.t_Co = 256
vim.opt.guifont = 'Hack Nerd Font:h12'
vim.opt.wildignore = '*.class,*.jar,*.swf,*.swc,*.git,*.jpg,*.png,*.mp3,*.pyc,*/build/*,*/node_modules/*,*/bower_components/*'

vim.g.neovide_transparency = 0.8

-- " Plugin configs

vim.g.bclose_multiple = 1
vim.g.grepper = {}
vim.g.grepper.tools = {'ag'}
vim.g.NERDTreeIgnore = {'^node_modules$', 'pyc$'}

-- autocommands

vim.api.nvim_create_autocmd('CompleteDone', {
	pattern = {'*'},
	command = 'pclose'
})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = {'*.go'},
	command = 'lua go_org_imports()'
})

-- mappings
local function map(mode, combo, mapping, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

vim.g.mapleader = " "

map('', '-', ':nohls<cr>')
map('n', '<C-n>', ':NERDTreeToggle<CR>')
map('v', '<leader>c', '<plug>NERDCommenterToggle')
map('n', '<leader>c', '<plug>NERDCommenterToggle')
map('v', '<C-y>', ":'<,'>w !xclip -selection clipboard<Cr><Cr>", {noremap = true})
map('v', '<C-v>', "<ESC>\"+p", {noremap = true})
map('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
map('', '<leader>p', ':bprevious<CR>', {noremap = true})
map('', '<leader>n', ':bnext<CR>', {noremap = true})
map('i', 'jk', '<Esc>')
map('n', '<leader>*', ':Grepper -tool ag -cword -noprompt<cr>')
map('n', '<leader>g', ':Grepper -tool ag<cr>')
map('i', '<C-Space>', '<C-x><C-o>', {noremap = true})
map('i', '<C-@>', '<C-Space>', {noremap = true})
map('n', '<silent> K', ':call <SID>show_documentation()<CR>', {noremap = true})
map('n', '<Leader>c', ':call DeleteCurBufferNotCloseWindow()<CR>', {noremap = true})
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})
map('v', 'y', 'myy`y', {noremap = true})
map('v', 'Y', 'myY`y', {noremap = true})
map('c', 'w!!', 'w !sudo tee % >/dev/null')
map('n', '<C-p>', ':Telescope find_files<cr>', {noremap = true})
map('n', '<leader>b', ':Telescope buffers<cr>', {noremap = true})

vim.cmd([[colorscheme kanagawa]])
