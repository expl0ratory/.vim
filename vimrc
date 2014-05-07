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

" lol, git
call pathogen#infect()

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
set ttimeoutlen=50

" stop at underscores as word delimiters
set iskeyword-=_
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
let g:airline_powerline_fonts = 1

au FileType html setlocal indentkeys-=*<Return>

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

let g:syntastic_python_flake8_args='--ignore=E501' 
let g:syntastic_python_flake8_args = "--max-line-length=160"
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

" Unite bindings
" replace command-t/ctrl-p
"let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
"let g:unite_source_file_rec_max_cache_files=8000
let g:unite_prompt='» '
"let g:unite_source_session_enable_auto_save = 1

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
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'logs/',
      \ 'build/',
      \ 'venv/',
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))

nnoremap <F4> :<C-u>UniteSessionSave

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite -no-split -buffer-name=files file_rec/async:!<CR>

nnoremap <silent> [unite]b :<C-u>Unite -no-split -buffer-name=buffer buffer<CR>
" Quick registers
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
"nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
"nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
" this is interesting
"nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
" this is interesting
"nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick file search
"nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -no-split -buffer-name=grep grep:.<CR>

" Quick line using the word under cursor
"nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
"nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -no-split -buffer-name=find find:.<CR>

" Quick commands
"nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
"nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

colorscheme monokai-refined
"colorscheme ir_black
"colorscheme jdesert
"colorscheme darkbone

hi SpellBad ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000
hi SpellCap ctermfg=255 ctermbg=196 guifg=#ffffff guibg=#ff0000
hi LineNr guifg=#777777
" tab format
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set smarttab
set cindent

set directory=~/.vim/tmp
set backupdir=~/.vim/backup

set hidden

" syntastic
let g:syntastic_phpcs_conf = "--config-set tab_width 2"

set clipboard=unnamed
