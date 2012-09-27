set encoding=utf-8

" lol, git
call pathogen#infect()

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

syntax on
filetype plugin indent on

" use space in normal mode to toggle insertion of single character
nmap <Space> i_<Esc>r

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
set wildignore+=*.class,*.jar,*.swf,*.swc,*.git,.svn/*,*.jpg,*.png,*.mp3,shared/sfxha/**,shared/casino-platform/fbpoker/**

" Command-T preferences
let g:CommandTMaxHeight = 5
let g:CommandTMinHeight = 5
let g:CommandTCancelMap = '<C-x>'
let g:CommandTMaxDepth = 20
let g:CommandTMaxFiles = 20000

" misc vim environ settings
set hlsearch

let g:svndiff_autoupdate=1

" vimdiff sexyness
set diffopt=filler
set diffopt+=iwhite
set t_Co=256
set cursorline

" Powerline
set guifont=Source\ Code\ Pro\ for\ Powerline\ 14 
let g:Powerline_symbols='fancy'
set fillchars+=stl:\ ,stlnc:\ 
set laststatus=2

" why not use semi sem instead of sem?
nnoremap ; :

" Use the right ctags copy
let Tlist_Ctags_Cmd=$HOME . '/.vim/ctags/ctags'
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 1

" SmartBufferDelete remapings, don't kill special buffers
nnoremap <silent> <leader>bd    :Sbd<CR>
nnoremap <silent> <leader>bdm   :Sbdm<CR>

au BufNewFile,BufRead *.anim set filetype=javascript
au BufRead,BufNewFile *.as set filetype=actionscript

au Filetype ruby,php,actionscript,javascript,java,cpp set relativenumber
au FileType taglist setlocal norelativenumber

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

" poker mandated tab format
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

" miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

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
      \   call system('ctags -a '.expand('%')) |
      \ endif
