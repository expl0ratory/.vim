set encoding=utf-8

if has("gui_running")
    set guioptions=egmrt
endif

" lol, git
call pathogen#infect()

syntax on
filetype plugin indent on
set nowrap

" stop at underscores as word delimiters
set iskeyword-=_

" use space in normal mode to toggle insertion of single character
" nmap <Space> i_<Esc>r

" Fix my most common typos
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
set wildignore+=*.class,*.jar,*.swf,*.swc,*.git,.svn/*,*.jpg,*.png,*.mp3,*.pyc

" Command-T preferences
let g:CommandTMaxHeight = 15
let g:CommandTMinHeight = 3 
let g:CommandTCancelMap = '<C-x>'
let g:CommandTMaxDepth = 20
let g:CommandTMaxFiles = 20000

" misc vim environ settings
set hlsearch
map - :nohls<cr>
set smartcase

cmap w!! w !sudo tee % >/dev/null

" vimdiff sexyness
set diffopt=filler
set diffopt+=iwhite
set t_Co=256
set cursorline

let g:miniBufExplVSplit=20

" SmartBufferDelete remapings, don't kill special buffers
nnoremap <silent> <leader>bd    :Sbd<CR>
nnoremap <silent> <leader>bdm   :Sbdm<CR>

au BufNewFile,BufRead *.anim set filetype=javascript
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.py set filetype=python

au Filetype ruby,php,actionscript,javascript,java,cpp,python,html set relativenumber
au FileType html setlocal indentkeys-=*<Return>
" au BufWritePost *.py call Flake8()

let g:flake8_max_line_length=120
let g:syntastic_python_checker_args='--ignore=E501' 
" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv

"Paste Toggle for stuff coming from outside vim
noremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

colorscheme molokai
"colorscheme ir_black
"colorscheme jdesert
"colorscheme darkbone

" tab format
set tabstop=2
set autoindent
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2
set cindent

let directory=$HOME . '/.vim/tmp'
let backupdir=$HOME . '/.vim/backup'

set hidden

" syntastic
let g:syntastic_phpcs_conf = "--config-set tab_width 2"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType actionscript setlocal omnifunc=actionscriptcomplete#CompleteAS
autocmd FileType cpp setlocal omnifunc=omni#cpp#complete#Main

" auto update tags file on save
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('~/.vim/ctags/ctags -a '.expand('%')) |
      \ endif

" search up the directory tree for first tags file
set tags=tags;/

set clipboard=unnamed
