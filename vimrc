
set nocompatible
"set clipboard+=unnamedplus
let g:loaded_clipboard_provider = 1
set runtimepath+=/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim
"set runtimepath+=~/.config/nvim/dein/repos/github.com/automizu/LanguageClient-neovim

if dein#load_state('/home/alex/.cache/dein')
  call dein#begin('/home/alex/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " Required:
    call dein#add('unblevable/quick-scope.git')
    call dein#add('neoclide/vim-easygit')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('neoclide/coc.nvim', {'do': 'yarn install'})
    call dein#add('mrk21/yaml-vim')
    call dein#add('neomake/neomake')
    call dein#add('mhinz/vim-grepper')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('pangloss/vim-javascript')
    call dein#add('mxw/vim-jsx')
    call dein#add('mattn/emmet-vim')
    call dein#add('gabrielelana/vim-markdown')
    call dein#add('junegunn/fzf')
    call dein#add('liuchengxu/vista.vim')
    call dein#add('joshdick/onedark.vim')
    call dein#add('bluz71/vim-nightfly-guicolors')
    call dein#add('towolf/vim-helm')

  call dein#end()
  call dein#save_state()
endif


" and a lot more plugins.....

" CocInstall coc-eslint (and probably other things)

:command -nargs=* Make make <args> | cwindow 3

let mapleader = " "
set encoding=utf-8
set tags=project.tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
 set termguicolors

let g:lightLine = { 'colorscheme': 'nightfly' }

let g:nightflyCursorColor = 1
let g:nightflyFloatingFZF = 1

" set t_Co=256
"colorscheme molokai
set guifont=Hack\ NF:h16
let g:neovide_transparency=0.8

if has("gui_running")
    set guioptions=egmrt
    set transparency=15
    "call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font 10')
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
endif

" syntax highlighting tweaks
let python_print_as_function = 1
let python_highlight_string_format = 1

colorscheme nightfly

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines) 
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

" Invoke command. 'g' is for call graph, kinda.
nnoremap <silent> <Leader>s :call Cscope('3', expand('<cword>'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Term mode (neovim) settings
tnoremap <Esc> <C-\><C-n>

let bclose_multiple = 1
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server - Completion (CoC) and Tagbar (Vista) stuff
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"<Paste>

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Vista tags stuff
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Grepper
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool ag<cr>

let g:grepper = {}
let g:grepper.tools = ['ag']


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " Closes preview window 

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"augroup PreviewOnBottom
"    autocmd InsertEnter * set splitbelow
"    autocmd InsertLeave * set splitbelow!
"augroup END

" Open fold under cursor
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

" re-select visual block after indent or outdent
vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

noremap <leader>p :bprevious<CR>
noremap <leader>n :bnext<CR>
inoremap jk <Esc>

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

set showmode

nnoremap <C-p> :FZF<cr>

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
"let g:fzf_layout = { 'down': '~20%' }
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
nnoremap <leader>b :call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'),
            \               'bufname(v:val)'),
            \ 'sink': 'e', 'down': '20%'})<cr>
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

set fillchars=vert:│
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost * Neomake 

hi clear SignColumn
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText ctermbg=none guibg=None
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

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> <leader>P :call ClipboardPaste()<cr>p

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
