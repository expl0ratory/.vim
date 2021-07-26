
" let dein know where it lives
set runtimepath+=/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/alex/.cache/dein')
  call dein#begin('/home/alex/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " Required:
    call dein#add('projekt0n/github-nvim-theme')
    call dein#add('jacoborus/tender.vim')
    call dein#add('drewtempelmeyer/palenight.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('hoob3rt/lualine.nvim')
    call dein#add('kyazdani42/nvim-web-devicons')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('nvim-lua/completion-nvim')
    call dein#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('ryanoasis/vim-devicons')
    " audit usage
    call dein#add('preservim/nerdcommenter')
    call dein#add('mrk21/yaml-vim')
    call dein#add('mhinz/vim-grepper')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('gabrielelana/vim-markdown')
    call dein#add('junegunn/fzf')
    call dein#add('liuchengxu/vista.vim')
    call dein#add('joshdick/onedark.vim')
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

" Autocomplete bs
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

autocmd CompleteDone * pclose " Closes preview window 

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

" File browser settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

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
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=none guibg=None
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

" Vista tags stuff
" Call :Vista, maybe bind that to a T thing?
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ 'py': 'vim_lsp',
  \ 'python': 'vim_lsp'
  \ }

let g:grepper = {}
let g:grepper.tools = ['ag']

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"let g:fzf_files_options =
"  \ '--color "border:#6699cc,info:#fabd2f" --preview "highlight -O ansi --force {} 2> /dev/null"'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \ <q-args>,
  \ ' --color-path 35 --color-match "1;35" --color-line-number 32',
  \ fzf#vim#with_preview(),
  \ <bang>0) 

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 30
  let width = float2nr(&columns - (&columns * 4 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 10,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

let g:NERDTreeIgnore = ['^node_modules$', 'pyc$']

""""""""""""""""""""""""""""""""""""""""""""
" Visual stuff
""""""""""""""""""""""""""""""""""""""""""""

set termguicolors

lua <<EOF
    require('github-theme').setup({
        sidebars = {"qf", "vista", "terminal", "nerdtree", "fzf", "FZF"}
    })

    require('lualine').setup({
        options = { 
            theme = 'github'
        }
    })
EOF

" set t_Co=256
"colorscheme molokai
set guifont=Hack\ NF:h16
let g:neovide_transparency=0.8

" Color settings
if has("gui_running")
    set guioptions=egmrt
    set transparency=15
    "call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font 10')
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
endif

colorscheme github

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
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

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
    }
  }
end

EOF

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Search in visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

nnoremap <C-p> :FZF<cr>
nnoremap <M-p> :FZF<cr>

nnoremap <leader>b :call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'),
            \               'bufname(v:val)'),
            \ 'sink': 'e', 'down': '20%'})<cr>

map <F7> :-1r !xclip -o -sel<CR>

let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor


