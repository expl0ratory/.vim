" let dein know where it lives -- Why do I not use vimplug?  I don't know
set runtimepath+=/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/alex/.cache/dein')
  call dein#begin('/home/alex/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " Required:
    call dein#add('EdenEast/nightfox.nvim') " colorscheme
    call dein#add('jacoborus/tender.vim') " what is this 
    call dein#add('L3MON4D3/LuaSnip') " Used by completion 
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('hoob3rt/lualine.nvim')
    call dein#add('kyazdani42/nvim-web-devicons')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('Maan2003/lsp_lines.nvim')
    call dein#add('hrsh7th/cmp-nvim-lsp')
    call dein#add('hrsh7th/cmp-buffer')
    call dein#add('hrsh7th/cmp-path')
    call dein#add('hrsh7th/cmp-cmdline')
    call dein#add('hrsh7th/nvim-cmp')
    call dein#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('ryanoasis/vim-devicons')
    " audit usage
    call dein#add('preservim/nerdcommenter') " how do
    call dein#add('mrk21/yaml-vim')
    call dein#add('mhinz/vim-grepper')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('gabrielelana/vim-markdown')
    call dein#add('nvim-lua/popup.nvim')
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-telescope/telescope.nvim')
    call dein#add('psf/black', { 'branch': 'stable' })
  call dein#end()
  call dein#save_state()
endif


""""""""""""""""""""""""""""""""""""""""""""
" General vim
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"set clipboard+=unnamedplus
"let g:loaded_clipboard_provider = 1

set encoding=utf-8
" Ideally, no tags ever needed again if language server can do it
set tags=project.tags

let bclose_multiple = 1
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
"set relativenumbers
set nocursorline
set nocursorcolumn
set synmaxcol=200

syntax on
filetype plugin indent on
set nowrap
set ttimeoutlen=100

" stop at underscores as word delimiters
" set iskeyword-=_
set number

function! s:show_documentation()
  if &filetype == 'vim'
      execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
              endif
              endfunction

""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noinsert,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF

"  End autocomplete stuff

" Don't know if anything uses this anymore
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

autocmd CompleteDone * pclose " Closes preview window 
" End don't know 


au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Need to fix black removing u's / get more in line with what we're using at
" cratejoy
"augroup black_on_save
"    autocmd!
"    autocmd BufWritePre *.py Black
"augroup end

""""""""""""""""""""""""""""""""""""""""""""
" Close current buffer without closing the current window
""""""""""""""""""""""""""""""""""""""""""""
func! DeleteCurBufferNotCloseWindow() abort
    if &modified
        echohl ErrorMsg
        echom "E89: no write since last change"
        echohl None
    elseif winnr('$') == 1
        bd
    else  " multiple window
        let oldbuf = bufnr('%')
        let oldwin = winnr()
        while 1   " all windows that display oldbuf will remain open
            if buflisted(bufnr('#'))
                b#
            else
                bn
                let curbuf = bufnr('%')
                if curbuf == oldbuf
                    enew    " oldbuf is the only buffer, create one
                endif
            endif
            let win = bufwinnr(oldbuf)
            if win == -1
                break
            else        " there are other window that display oldbuf
                exec win 'wincmd w'
            endif
        endwhile
        " delete oldbuf and restore window to oldwin
        exec oldbuf 'bd'
        exec oldwin 'wincmd w'
    endif
endfunc
" End Close current buffer



" IS this used since I'm using nerdtree?
" File browser settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Am I using this at all
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},\  " filetype
set statusline+=%{&fileformat}]\              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2 


" vimdiff sexyness
set diffopt=filler
set diffopt+=iwhite
 
autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e
au FileType html setlocal indentkeys-=*<Return>

au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
au FileType markdown setlocal tw=80
au FileType markdown setlocal wrap linebreak nolist
let g:markdown_fenced_languages = ['javascript', 'sh', 'yaml', 'html', 'json', 'diff', 'python']
let g:markdown_enable_spell_checking = 0
" let g:markdown_enable_conceal = 1

set showmode

" Don't pay attention to these files
set wildignore=*.class,*.jar,*.swf,*.swc,*.git,*.jpg,*.png,*.mp3,*.pyc,*/build/*,*/node_modules/*,*/bower_components/*

" misc vim environ settings
set hlsearch
set smartcase

set fillchars=vert:│
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

hi clear SignColumn
set linespace=2

" tab format
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set smarttab
set cindent

set nobackup
set nowritebackup
set noswapfile

set foldmethod=syntax
set hidden

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab

"set clipboard=unnamedplus
"if $TMUX == ''
"    set clipboard+=unnamed
"endif 

vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>

""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
""""""""""""""""""""""""""""""""""""""""""""

let g:grepper = {}
let g:grepper.tools = ['ag']

let g:NERDTreeIgnore = ['^node_modules$', 'pyc$']

""""""""""""""""""""""""""""""""""""""""""""
" Visual stuff
""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256
lua <<EOF
-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
EOF

"set guifont=font:hsize
set guifont=Hack\ Nerd\ Font:h8
"let g:neovide_transparency=0.8

" syntax highlighting tweaks
let python_print_as_function = 1
let python_highlight_string_format = 1

""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

map - :nohls<cr>
nmap <C-n> :NERDTreeToggle<CR>
vmap <leader>c <plug>NERDCommenterToggle
nmap <leader>c <plug>NERDCommenterToggle

" Term mode (neovim) settings
tnoremap <Esc> <C-\><C-n>

" Grepper
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool ag<cr>

lua <<EOF

require("lsp_lines").setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true
})

vim.keymap.set(
  "",
  "<Leader>d",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

nvim_lsp.pyright.setup({
  -- ...
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  on_attach=require'completion'.on_attach
  require'completion'.on_attach()
  --Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd_env = {
      VIRTUAL_ENV = "$HOME/Code/cjdev/services/store/venv"
    }
  }
end

--nvim_lsp.pyright.setup({
--  -- ...
--  before_init = function(_, config)
--    config.settings.python.pythonPath = get_python_path(config.root_dir)
--  end
--})

EOF

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Search in visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
set shortmess+=c

" Open fold under cursor
nnoremap <space> za

"close buffer without wrecking layout
nnoremap <Leader>c :call DeleteCurBufferNotCloseWindow()<CR>

" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

noremap <leader>p :bprevious<CR>
noremap <leader>n :bnext<CR>
inoremap jk <Esc>

cmap w!! w !sudo tee % >/dev/null

nnoremap <C-p> :Telescope find_files<cr>

map <F7> :-1r !xclip -o -sel<CR>
