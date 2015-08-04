" Vim color file
" Maintainer: Juan frias <juandfrias at gmail dot com>
" Last Change: 2009 Apr 4
" Version: 1.0.0
" URL: http://juan.axisym3.net/vim-color-schemes/#symfony

highlight clear
if exists("syntax_on")
syntax reset
endif

let g:colors_name = "symfony"
set background=dark

highlight Normal ctermfg=15 ctermbg=233 guifg=#e5e5e5 guibg=#222222 gui=none

" Search
highlight IncSearch ctermfg=0 ctermbg=202 guifg=#000000 guibg=#ff5f00 gui=none
highlight Search ctermfg=16 ctermbg=202 guifg=#000000 guibg=#ff5f00 gui=none

" Messages
highlight ErrorMsg ctermfg=15 ctermbg=196 guifg=#e5e5e5 guibg=#ff0000 gui=none
highlight WarningMsg ctermfg=196 guifg=#ff0000 gui=none
highlight ModeMsg cterm=bold gui=bold
highlight MoreMsg cterm=bold ctermfg=72 gui=bold guifg=#5faf87
highlight Question cterm=bold ctermfg=46 gui=bold guifg=#00ff00

" Split area area
highlight StatusLine cterm=bold,reverse gui=bold guifg=#000000 guibg=#d5d5d5
highlight StatusError gui=bold guifg=#000000 guibg=#cf0000

highlight StatusLineNC cterm=reverse gui=none guifg=#000000 guibg=#909090
highlight VertSplit ctermfg=255 ctermbg=255  guifg=#d5d5d5 guibg=#d5d5d5 gui=none
highlight WildMenu ctermfg=0 ctermbg=226 guifg=#000000 guibg=#ffff00 gui=none

" Diff
highlight DiffAdd ctermfg=254 ctermbg=71 guifg=#e4e4e4 guibg=#5faf5f gui=none
highlight DiffDelete ctermfg=236 ctermbg=234 guifg=#303030 guibg=#1c1c1c gui=none
highlight DiffChange ctermbg=52 guibg=#5f0000 gui=none
highlight DiffText ctermfg=254 ctermbg=124 guifg=#e4e4e4 guibg=#af0000 gui=none

" Cursor
highlight CursorColumn ctermbg=241 guibg=#626262 gui=none
highlight CursorLine ctermbg=234 cterm=NONE guibg=#363636 gui=NONE
highlight Cursor ctermfg=0 ctermbg=15 guifg=#000000 guibg=#e5e5e5 gui=none
highlight lCursor ctermfg=15 ctermbg=233 guifg=#e5e5e5 guibg=#222222 gui=none

" Fold
highlight Folded ctermfg=236 ctermbg=248 guifg=#303030 guibg=#a8a8a8 gui=none
highlight FoldColumn ctermfg=236 ctermbg=250 guifg=#303030 guibg=#bcbcbc gui=none

" Popup Menu Menu
highlight Pmenu ctermbg=25  guibg=#005faf gui=none
highlight PmenuSel ctermbg=19  guibg=#0000af gui=none
highlight PmenuSbar ctermbg=250 guibg=#bcbcbc gui=none
highlight PmenuThumb cterm=reverse gui=reverse

" Syntax group
highlight Comment ctermfg=244 guifg=#808080 gui=none
highlight Member ctermfg=248 guifg=#a8a8a8 gui=none
highlight Constant ctermfg=67 guifg=#5f87af gui=none
highlight Error ctermfg=215 ctermbg=88 guifg=#ffaf5f guibg=#870000 gui=none
highlight Identifier ctermfg=67 guifg=#5f87af gui=none
highlight Ignore ctermbg=233 guibg=#222222 gui=none
highlight PreProc ctermfg=254 guifg=#e4e4e4 gui=none
highlight Special ctermfg=221 guifg=#ffd75f gui=none
highlight Statement ctermfg=208 ctermbg=233 guifg=#ff8700 guibg=#222222 gui=none
highlight Todo ctermfg=226 ctermbg=233 cterm=bold guifg=#ffff00 guibg=#222222 gui=bold
highlight Type ctermfg=167 guifg=#d75f5f gui=none
highlight Underlined cterm=underline ctermfg=111 gui=underline guifg=#87afff gui=none
highlight String ctermfg=118 guifg=#72e500 gui=none
highlight Number ctermfg=197 guifg=#ff005f gui=none
highlight Define ctermfg=221 guifg=#ffd75f gui=none
highlight Function ctermfg=221 guifg=#ffd75f gui=none
highlight Include ctermfg=173 guifg=#d7875f gui=none
highlight Keyword ctermfg=221 guifg=#ffd75f gui=none
highlight Operator ctermfg=208 guifg=#ff8700 gui=none
highlight PreCondit ctermfg=173 guifg=#d7875f gui=none
highlight StorageClass ctermfg=221 guifg=#ffd75f gui=none

"Spelling
highlight SpellBad cterm=undercurl ctermfg=160 gui=undercurl guifg=#d70000 gui=none
highlight SpellCap cterm=underline ctermfg=189 gui=underline guifg=#d7d7ff gui=none
highlight SpellLocal cterm=undercurl gui=undercurl
highlight SpellRare cterm=underline ctermfg=168 gui=underline guifg=#d75f87

" Other
highlight Directory ctermfg=51 guifg=#00ffff gui=none
highlight LineNr ctermfg=16  ctermbg=238 guifg=#000000 guibg=#444444 gui=none
highlight NonText ctermfg=239 ctermbg=233 guifg=#4e4e4e guibg=#222222 gui=none
highlight SpecialKey ctermfg=60 guifg=#5f5f87 gui=none
highlight Title cterm=bold ctermfg=15 guifg=#e5e5e5 gui=none
highlight Visual ctermbg=239 guibg=#4e4e4e gui=none
highlight MatchParen ctermfg=15 ctermbg=23 guifg=#e5e5e5 guibg=#005f5f gui=none
highlight SignColumn ctermfg=51 ctermbg=250 guifg=#00ffff guibg=#bcbcbc gui=none
highlight Structure ctermfg=221 guifg=#ffd75f gui=none
highlight TabLineFill cterm=reverse gui=reverse
highlight TabLine cterm=underline ctermbg=248 gui=underline guibg=#a8a8a8
highlight TabLineSel cterm=bold gui=bold
highlight VisualNOS cterm=bold,underline gui=bold,underline

" Links
highlight link Macro PreProc
highlight link Exception Statement
highlight link Conditional Statement
highlight link Repeat Statement
highlight link Label Statement
highlight link Boolean Constant
highlight link Float Number
highlight link Character Constant
highlight link Typedef Type
highlight link Tag Special
highlight link SpecialChar Special
highlight link Delimiter Special
highlight link SpecialComment Special
highlight link Debug Special

" vim:ff=unix:
