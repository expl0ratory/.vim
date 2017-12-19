" lol, git
set nocompatible
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim

call dein#begin(expand('~/.config/nvim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

call dein#add('unblevable/quick-scope.git')
call dein#add('Shougo/denite.nvim')
call dein#add('chemzqm/vim-easygit')
call dein#add('chemzqm/denite-git')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi')
call dein#add('neomake/neomake')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('davidhalter/jedi-vim')
call dein#add('faith/vim-go')

" and a lot more plugins.....

call dein#end()

set encoding=utf-8
" set t_Co=256

if has("gui_running")
    set guioptions=egmrt
    set transparency=15
    set GuiFont Hack:h9
    "set guifont=Literation\ Mono\ Powerline:h12
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
    "set guifont=Hack:h12
endif

set tags=project.tags

" Term mode (neovim) settings
tnoremap <Esc> <C-\><C-n>

" syntax highlighting tweaks
let python_highlight_builtins = 1
let python_highlight_file_headers_as_comments = 1
let python_print_as_function = 1
let python_highlight_string_format = 1

let bclose_multiple = 1

" Autocomplete bs
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag', 'jedi']
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " Closes preview window 

nnoremap <space> za
"set t_ut= 
let g:netrw_liststyle=3
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

" Fix my most common typos
ca W w
ca WQ wq
ca Wq wq
ca WQa wqa
ca Wqa wqa
ca Q q
ca Qa qa
ca Qa! qa!
ca QA! qa!
ca Q! q!

" Don't pay attention to these files
set wildignore+=*.class,*.jar,*.swf,*.swc,*.git,*.jpg,*.png,*.mp3,*.pyc

" misc vim environ settings
set hlsearch
map - :nohls<cr>
set smartcase

cmap w!! w !sudo tee % >/dev/null

" vimdiff sexyness
set diffopt=filler
set diffopt+=iwhite
 
autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e
au FileType html setlocal indentkeys-=*<Return>
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
au FileType markdown setlocal textwidth=100
let g:markdown_fenced_languages = ['javascript', 'sh', 'yaml', 'html', 'json', 'diff', 'python']

" Custom syntastic settings:
function s:find_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:find_jshintrc(l:dir)
    let g:syntastic_javascript_jshint_conf = l:jshintrc
endfunction

let g:neomake_warning_sign= {'text': "⚠", 'texthl': 'Warning'}
let g:neomake_error_sign= {'text': "✗", 'texthl': 'Error'}

" grepper neovim plugin
let g:grepper = {}
let g:grepper.programs = ['ag', 'git']

nmap <leader>g <plug>(Grepper)
xmap <leader>g <plug>(Grepper)
cmap <leader>g <plug>(GrepperNext)
nmap gs        <plug>(GrepperMotion)
xmap gs        <plug>(GrepperMotion)
nmap <leader>t :TagbarToggle<CR>
nmap <leader>f :E<cr>

" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

"Paste Toggle for stuff coming from outside vim
noremap <F2> :set invpaste paste?<CR>
noremap <C-l> :bprevious<CR>
noremap <C-h> :bnext<CR>
noremap <leader>d :Bdelete<CR>
set pastetoggle=<F2>
set showmode

" Fuzzy finder
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher_fuzzy'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'build/', '*.min.*', '*.pyc',
          \   'bower_components', 'node_modules'])
call denite#custom#option('default', 'highlight_mode_insert', 'PMenu')

nnoremap <C-p> :Denite -buffer-name=files file_rec<cr>
nnoremap <leader>b :Denite buffer<cr>
nnoremap <leader>g :Denite grep:.<cr>

nmap <leader>u :cscope find s <cword><CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()



"colorscheme monokai-refined
colorscheme molokai

set fillchars=vert:│
hi Normal          guifg=#dbdbd0 guibg=#272822
hi Pmenu ctermfg=75 ctermbg=0 guifg=#688df2 guibg=#000000
hi PmenuSel ctermfg=123 ctermbg=238 guifg=#5bbcd9 guibg=#454545
hi SpellBad ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000
hi SpellCap ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#272822   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#000000 ctermbg=16
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost * Neomake 

hi clear SignColumn
hi GitGutterAdd guibg=#000000 ctermbg=0 ctermfg=green guifg=darkgreen
hi GitGutterChange guibg=#000000 ctermbg=0 ctermfg=yellow guifg=yellow
hi GitGutterDelete guibg=#000000 ctermbg=0 ctermfg=red guifg=darkred
hi GitGutterChangeDelete guibg=#000000 ctermbg=0 ctermfg=red guifg=darkred

hi VertSplit       guifg=#080808 guibg=#080808
hi VertSplit       ctermfg=232 ctermbg=232
"hi NonText guifg=#272822 guibg=#272822 ctermbg=234 ctermfg=234
hi CursorLine   guibg=#000000 ctermbg=0
hi CursorLineNr    guifg=#FD971F ctermbg=0
hi LineNr guifg=#7E8E91 guibg=#000000 ctermfg=59 ctermbg=0

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

" syntastic
let g:syntastic_phpcs_conf = "--config-set tab_width 2"

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab

set clipboard=unnamedplus
if $TMUX == ''
    set clipboard+=unnamed
endif 

" custom quick scope improvements
" Insert into your .vimrc after quick-scope is loaded.
" Obviously depends on <https://github.com/unblevable/quick-scope> being installed.

" Thanks to @VanLaser for cleaning the code up and expanding capabilities to include e.g. `df`

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
