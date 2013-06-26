set encoding=utf-8

if has("gui_running")
    set guioptions=egmrt
    set transparency=15
endif

" lol, git
call pathogen#infect()

syntax on
filetype plugin indent on
set nowrap

" stop at underscores as word delimiters
set iskeyword-=_
set number
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

au FileType html setlocal indentkeys-=*<Return>
" au BufWritePost *.py call Flake8()

let g:syntastic_python_flake8_args='--ignore=E501' 
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_error_symbol="✗"

" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv

"Paste Toggle for stuff coming from outside vim
noremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Unite bindings
" replace command-t/ctrl-p
 let g:unite_data_directory='~/.vim/.cache/unite'
 let g:unite_enable_start_insert=1
 let g:unite_source_history_yank_enable=1
 let g:unite_source_file_rec_max_cache_files=5000
 let g:unite_prompt='» '
 let g:unite_source_session_enable_auto_save = 1
 
 if executable('ag')
   let g:unite_source_grep_command='ag'
   let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
   let g:unite_source_grep_recursive_opt=''
 elseif executable('ack')
   let g:unite_source_grep_command='ack'
   let g:unite_source_grep_default_opts='--no-heading --no-color -a'
   let g:unite_source_grep_recursive_opt=''
 endif
 
 call unite#filters#matcher_default#use(['matcher_fuzzy'])
 call unite#filters#sorter_default#use(['sorter_rank'])
 call unite#set_profile('files', 'smartcase', 1)
 call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))

 nnoremap <F4> :<C-u>UniteSessionSave

 " Map space to the prefix for Unite
 nnoremap [unite] <Nop>
 nmap <space> [unite]

 " General fuzzy search
 nnoremap <silent> [unite]<space> :<C-u>Unite
       \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

 " Quick registers
 nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

 " Quick buffer and mru
 nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

 " Quick yank history
 nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
" this is interesting
"nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
" this is interesting
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

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
