" lol, git
set nocompatible
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim
set runtimepath+=~/.config/nvim/dein/repos/github.com/automizu/LanguageClient-neovim

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
call dein#add('chemzqm/vim-easygit')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('neoclide/coc.nvim', {'do': 'yarn install'})
call dein#add('mrk21/yaml-vim')
call dein#add('neomake/neomake')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('mattn/emmet-vim')
call dein#add('gabrielelana/vim-markdown')
call dein#add('junegunn/fzf')
call dein#add('joshdick/onedark.vim')

" and a lot more plugins.....

call dein#end()

let g:user_emmet_leader_key='\'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let mapleader = " "
set encoding=utf-8
" set t_Co=256
colorscheme molokai

if has("gui_running")
    set guioptions=egmrt
    set transparency=15
    call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font 10')
    colorscheme onedark
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

" Language Server?
set hidden

set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"<Paste>

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Search in visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

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
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 4
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag', 'jedi']

let g:deoplete#sources#jedi#server_timeout = 2
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " Closes preview window 

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

nnoremap <space> za

"close buffer without wrecking layout
nnoremap <Leader>c :call DeleteCurBufferNotCloseWindow()<CR>

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
set wildignore=*.class,*.jar,*.swf,*.swc,*.git,*.jpg,*.png,*.mp3,*.pyc,*/build/*,*/node_modules/*,*/bower_components/*

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
au FileType markdown setlocal tw=80
au FileType markdown setlocal wrap linebreak nolist
let g:markdown_fenced_languages = ['javascript', 'sh', 'yaml', 'html', 'json', 'diff', 'python']
let g:markdown_enable_spell_checking = 0
" let g:markdown_enable_conceal = 1

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

noremap <leader>p :bprevious<CR>
noremap <leader>n :bnext<CR>
inoremap kj <Esc>
set showmode


"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"	      \ [ '.git/', '.ropeproject/', '__pycache__/',
"	      \   'venv/', 'build/', '*.min.*', '*.pyc',
"          \   '*/bower_components/*', '*/node_modules/*',
"          \   '*/build/*'])

nnoremap <C-p> :FZF<cr>

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
nnoremap <leader>b :call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'),
            \               'bufname(v:val)'),
            \ 'sink': 'e', 'down': '20%'})<cr>

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

map <F7> :-1r !xclip -o -sel<CR>

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

" Set a transparent background
hi Normal guibg=None ctermbg=None
