set encoding=utf-8

call pathogen#infect()

syntax on
filetype plugin indent on

" vimdiff sexyness
set diffopt=filler
set diffopt+=iwhite
set t_Co=256

" Powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
let g:Powerline_symbols='fancy'
set fillchars+=stl:\ ,stlnc:\
set laststatus=2

" why not use semi sem instead of sem?
nnoremap ; :

" Use the right ctags copy
let Tlist_Ctags_Cmd=$HOME . '/bin/ctags'
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 1

" SmartBufferDelete remapings, don't kill special buffers
nnoremap <silent> <leader>bd    :Sbd<CR>
nnoremap <silent> <leader>bdm   :Sbdm<CR>

au BufNewFile,BufRead *.anim set filetype=javascript
au BufRead,BufNewFile *.as set filetype=actionscript
au BufNewFile,BufRead *.anim,*.js,*.java,*.as,*.php let b:allowLineNumbers=1

if !exists("b:allowLineNumbers")
  set relativenumber
else
  set norelativenumber
endif

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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType actionscript setlocal omnifunc=actionscriptcomplete#CompleteAS

