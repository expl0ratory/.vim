
call plug#begin()

  " Add or remove your plugins here like this:
  
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'dgagn/diagflow.nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'fatih/vim-go' " go tools
    Plug 'hoob3rt/lualine.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig' " So you can config lsps, derp
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " magical syntax highligher, in theory more
    Plug 'nvim-treesitter/nvim-treesitter-context' 
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'scrooloose/nerdtree' " boujee file navigator
    Plug 'Xuyuanp/nerdtree-git-plugin' 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons' 
    Plug 'christoomey/vim-tmux-navigator' " ctrl-hjkl for pane/window nav, pretty seamless
    Plug 'preservim/nerdcommenter' "  <leader>c<space>
    Plug 'mrk21/yaml-vim'  " yaml highlighter
    Plug 'mhinz/vim-grepper'  " <leader>g
    Plug 'tpope/vim-fugitive'  " git stuff
    Plug 'airblade/vim-gitgutter' 
    Plug 'gabrielelana/vim-markdown' " markdown highlighter? 
    Plug 'OXY2DEV/markview.nvim'
    Plug 'wfxr/protobuf.vim' " protobuf highlighter?
    Plug 'nvim-lua/plenary.nvim'  " requirement for telescope
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""
" General vim
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

set clipboard=unnamedplus
"let g:loaded_clipboard_provider = 1

set encoding=utf-8

" Ideally, no tags ever needed again if language server can do it
set tags=project.tags

let bclose_multiple = 1
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
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

""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noinsert,noselect

lua <<EOF
require('diagflow').setup()

require'treesitter-context'.setup{
enable = true,
max_lines = 0,
min_window_height = 0,
line_numbers = true,
multiline_threshold = 20,
trim_scop = 'outer',
mode = 'cursor',
separator = nil,
zindex=20
}

local mv = require('markview');
local presets = require('markview.presets');

mv.setup({
    modes = { "n", "no", "c", "i"}, 
    hybrid_modes = { "i" },
    callbacks = {
        on_enable = function(_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].concealcursor = "c";
        end
    },
    headings = {
        enable = true,
        shift_width = 0,

        heading_1 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_right = "",
            corner_right_hl = "Heading1Corner",

            hl = "Heading1"
        }
    },
    code_blocks = {
        enable = true,
        style = "simple",
        hl = "CursorLine"
    }
});

EOF

autocmd CompleteDone * pclose " Closes preview window  "

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"" Close current buffer without closing the current window

func! DeleteCurBufferNotCloseWindow() abort
    if &modified
        echohl ErrorMsg
        echom "E89: no write since last change"
        echohl None
    elseif winnr('$') == 1
        bd
    else  "" multiple window
        let oldbuf = bufnr('%')
        let oldwin = winnr()
        while 1   "" all windows that display oldbuf will remain open
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
        "" delete oldbuf and restore window to oldwin
        exec oldbuf 'bd'
        exec oldwin 'wincmd w'
    endif
endfunc

autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e
au FileType html setlocal indentkeys-=*<Return>

set showmode

set hlsearch
set smartcase

hi clear SignColumn
set linespace=2

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

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab

vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>
vnoremap <C-v> <ESC>"+p

" Plugin configs

let g:grepper = {}
let g:grepper.tools = ['ag']

let g:NERDTreeIgnore = ['^node_modules$', 'pyc$']

set t_Co=256

set guifont=Hack\ Nerd\ Font:h12

lua <<EOF

vim.g.neovide_transparency = 0.8

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = true,
    overrides = function(colors)
        return {
            LineNr = { bg = 'NONE'},
            SignColumn = { bg = 'NONE'},
        }
    end,
}) 

vim.cmd("colorscheme kanagawa")

EOF

let python_print_as_function = 1
let python_highlight_string_format = 1

let mapleader = " "

map - :nohls<cr>
nmap <C-n> :NERDTreeToggle<CR>
vmap <leader>c <plug>NERDCommenterToggle
nmap <leader>c <plug>NERDCommenterToggle

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool ag<cr>

lua <<EOF

require("mason").setup()
require("mason-lspconfig").setup {
    automatic_installation = true
}

local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

-- nvim_lsp.pyright.setup({
--   -- ...
--   before_init = function(_, config)
--     config.settings.python.pythonPath = get_python_path(config.root_dir)
--   end
-- })

nvim_lsp.pylsp.setup({
    cmd = { "pylsp" },
    on_attach = on_attach
})

nvim_lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pylsp", "tsserver", "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd_env = {
      VIRTUAL_ENV = "$HOME/Code/cjdev/services/store/venv"
    }
  }
end

--nvim_lsp.pyright.setup({
--  -- ...
--  before_init = function(_, config)
--    config.settings.python.pythonPath = get_python_path(config.root_dir)
--  end
--})

  function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
EOF

autocmd BufWritePre *.go lua go_org_imports()

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:lsc_server_commands = {
\  "go": {
\    "command": "gopls serve",
\    "log_level": -1,
\    "suppress_stderr": v:true,
\  },
\}

nnoremap <Leader>c :call DeleteCurBufferNotCloseWindow()<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

noremap <leader>p :bprevious<CR>
noremap <leader>n :bnext<CR>
inoremap jk <Esc>

cmap w!! w !sudo tee % >/dev/null

nnoremap <C-p> :Telescope find_files<cr>
nnoremap <leader>b :Telescope buffers<cr>

au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
au FileType markdown setlocal tw=80
au FileType markdown setlocal wrap linebreak nolist
let g:markdown_fenced_languages = ['javascript', 'sh', 'yaml', 'html', 'json', 'diff', 'python']
let g:markdown_enable_spell_checking = 0

set wildignore=*.class,*.jar,*.swf,*.swc,*.git,*.jpg,*.png,*.mp3,*.pyc,*/build/*,*/node_modules/*,*/bower_components/*
