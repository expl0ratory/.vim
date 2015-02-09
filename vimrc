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

set t_ut= 
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

" NERDTree
"autocmd vimenter * NERDTree
"set autochdir
nmap <silent> <C-D> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_rec_max_cache_files = 0
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Unite bindings
" replace command-t/ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_prompt='» '
"let g:unite_split_rule = "botright"

"call unite#custom#profile('default', 'context', {
	"\   'start_insert': 1,
	"\   'winheight': 10,
	"\   'direction': 'botright',
	"\ })

call unite#custom#source('file_mru,buffer,grep',
      \ 'ignore_pattern', join([
      \ 'node_modules/',
      \ 'bower_components/',
      \ '\.pyc',
      \ 'logs/',
      \ 'build/',
      \ 'venv/',
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))

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

set clipboard=unnamed
if $TMUX == ''
    set clipboard+=unnamed
endif 
