" lol, git
call pathogen#infect()

set encoding=utf-8
set t_Co=256

if has("gui_running")
    set guioptions=egmrt
    set transparency=15
    set guifont=Literation\ Mono\ Powerline:h12
endif

" syntax highlighting tweaks
let python_highlight_builtins = 1
let python_highlight_file_headers_as_comments = 1
let python_print_as_function = 1
let python_highlight_string_format = 1

let bclose_multiple = 1

"set t_ut= 
let g:netrw_liststyle=3
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},\  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\  " encoding
set statusline+=%{&fileformat}]\              " file format
set statusline+=%{fugitive#statusline()}
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2 

set relativenumber

syntax on
filetype plugin indent on
set nowrap
set ttimeoutlen=100

" stop at underscores as word delimiters
" set iskeyword-=_
set number

" Jedi
"let g:jedi#call_signature_escape = 0
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#show_call_signatures = "1"

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
set wildignore+=*.class,*.jar,*.swf,*.swc,*.git,.svn/*,*.jpg,*.png,*.mp3,*.pyc

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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#buffer_nr_show = 1
  
au FileType html setlocal indentkeys-=*<Return>
" au BufNewFile,BufRead *.apib set filetype=markdown

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

let g:syntastic_python_checkers = ['flake8']
let g:matchparent_timeout = 10
let g:matchparent_insert_timeout = 10

let g:syntastic_python_flake8_args='--ignore=E501' 
let g:syntastic_python_flake8_args = "--max-line-length=120"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_error_symbol="✗"

" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv

"Paste Toggle for stuff coming from outside vim
noremap <F2> :set invpaste paste?<CR>
noremap <C-l> :bprevious<CR>
noremap <C-h> :bnext<CR>
set pastetoggle=<F2>
set showmode

let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 0
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_source_file_mru_filename_format = ':~:.'
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep', 'max_candidates', 0)
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
    \ '\.pyc$',
    \ '\.git/',
    \ 'scratch/',
    \ 'www/js/libs/',
    \ 'venv/',
    \ 'build/',
    \ 'node_modules/',
    \ 'logs/',
    \ 'bower_components/',
    \ ], '\|'))
let g:unite_update_time = 300
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
try
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>b :<C-u>Unite -start-insert buffer<cr>
nnoremap <space>s :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>v :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" make a grep on all files!
nnoremap <space>/ :split<cr> :<C-u>Unite grep:.<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>

"colorscheme monokai-refined
colorscheme molokai

set fillchars=vert:│
hi Pmenu ctermfg=75 ctermbg=0 guifg=#688df2 guibg=#000000
hi PmenuSel ctermfg=123 ctermbg=238 guifg=#5bbcd9 guibg=#454545
hi SpellBad ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000
hi SpellCap ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000

hi clear SignColumn
hi GitGutterAdd guibg=#000000 ctermbg=0 ctermfg=green guifg=darkgreen
hi GitGutterChange guibg=#000000 ctermbg=0 ctermfg=yellow guifg=yellow
hi GitGutterDelete guibg=#000000 ctermbg=0 ctermfg=red guifg=darkred
hi GitGutterChangeDelete guibg=#000000 ctermbg=0 ctermfg=red guifg=darkred

"hi VertSplit       guifg=#080808 guibg=#080808 gui=bold
"hi VertSplit       ctermfg=232 ctermbg=232   cterm=bold
"hi NonText guifg=#272822 guibg=#272822 ctermbg=234 ctermfg=234
hi CursorLine   guifg=#000000 ctermbg=0
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

set clipboard=unnamed
if $TMUX == ''
    set clipboard+=unnamed
endif 
