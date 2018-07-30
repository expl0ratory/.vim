" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
" no guarantees for version 5.8 and below, but this makes it stop
" complaining
hi clear
if exists("syntax_on")
syntax reset
endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
let s:molokai_original = g:molokai_original
else
let s:molokai_original = 0
endif

hi Boolean guifg=#AE81FF
hi Character guifg=#E6DB74
hi Number guifg=#AE81FF
hi String guifg=#E6DB74
hi Conditional guifg=#F92672 gui=bold
hi Constant guifg=#AE81FF gui=bold
hi Cursor guifg=#000000 guibg=#F8F8F0
hi iCursor guifg=#000000 guibg=#F8F8F0
hi Debug guifg=#BCA3A3 gui=bold
hi Define guifg=#66D9EF
hi Delimiter guifg=#8F8F8F
hi DiffAdd guibg=#13354A
hi DiffChange guifg=#89807D guibg=#4C4745
hi DiffDelete guifg=#960050 guibg=#1E0010
hi DiffText guibg=#4C4745 gui=italic,bold
" tweaks
hi Include guifg=#F92672 gui=bold
hi Statement guifg=#66D9EF

hi Directory guifg=#A6E22E gui=bold
hi Error guifg=#E6DB74 guibg=#1E0010
hi ErrorMsg guifg=#F92672 guibg=#232526 gui=bold
hi Exception guifg=#A6E22E gui=bold
hi Float guifg=#AE81FF
hi FoldColumn guifg=#465457 guibg=#000000
hi Folded guifg=#465457 guibg=#000000
hi Function guifg=#A6E22E
hi Identifier guifg=#FD971F
hi Ignore guifg=#808080 guibg=bg
hi IncSearch guifg=#C4BE89 guibg=#000000

hi Keyword guifg=#F92672 gui=bold
hi Label guifg=#E6DB74 gui=none
hi Macro guifg=#C4BE89 gui=italic
hi SpecialKey guifg=#66D9EF gui=italic

hi MatchParen guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg guifg=#E6DB74
hi MoreMsg guifg=#E6DB74
hi Operator guifg=#F92672

" complete menu
hi Pmenu guifg=#66D9EF guibg=#000000
hi PmenuSel guibg=#808080
hi PmenuSbar guibg=#080808
hi PmenuThumb guifg=#66D9EF

hi PreCondit guifg=#A6E22E gui=bold
hi PreProc guifg=#A6E22E
hi Question guifg=#66D9EF
hi Repeat guifg=#F92672 gui=bold
hi Search guifg=#000000 guibg=#FFE792
" marks
hi SignColumn guifg=#A6E22E guibg=#232526
hi SpecialChar guifg=#F92672 gui=bold
hi SpecialComment guifg=#7E8E91 gui=bold
hi Special guifg=#66D9EF guibg=bg gui=italic
if has("spell")
hi SpellBad guisp=#FF0000 gui=undercurl
hi SpellCap guisp=#7070F0 gui=undercurl
hi SpellLocal guisp=#70F0F0 gui=undercurl
hi SpellRare guisp=#FFFFFF gui=undercurl
endif
"hi Statement guifg=#F92672 gui=bold
hi StatusLine guifg=#455354 guibg=fg
hi StatusLineNC guifg=#808080 guibg=#080808
hi StorageClass guifg=#FD971F gui=italic
hi Structure guifg=#66D9EF
hi Tag guifg=#F92672 gui=italic
hi Title guifg=#ef5939
hi Todo guifg=#FFFFFF guibg=bg gui=bold

hi Typedef guifg=#66D9EF
hi Type guifg=#66D9EF gui=none
hi Underlined guifg=#808080 gui=underline

hi VertSplit guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS guibg=#403D3D
hi Visual guibg=#403D3D
hi WarningMsg guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu guifg=#66D9EF guibg=#000000

hi TabLineFill guifg=#1B1D1E guibg=#1B1D1E
hi TabLine guibg=#1B1D1E guifg=#808080 gui=none

if s:molokai_original == 1
hi Normal guifg=#C6C6C4 guibg=#11110f
hi Comment guifg=#75715E
hi CursorLine guibg=#3E3D32
hi CursorLineNr guifg=#FD971F gui=none
hi CursorColumn guibg=#3E3D32
hi ColorColumn guibg=#3B3A32
hi LineNr guifg=#BCBCBC guibg=none
hi NonText guifg=#75715E
hi SpecialKey guifg=#75715E
else
hi Normal guifg=#C6C6C4 guibg=#1B1D1E
hi Comment guifg=#7E8E91
hi CursorLine guibg=#293739
hi CursorLineNr guifg=#FD971F gui=none
hi CursorColumn guibg=#293739
hi ColorColumn guibg=#232526
hi LineNr guifg=#465457 guibg=none
hi NonText guifg=#465457
hi SpecialKey guifg=#465457
end

"
" Support for 256-color terminal
"
if &t_Co > 255
hi Normal ctermbg=none

"if s:molokai_original == 1
" hi Normal guibg=#1c1c1c ctermbg=234
" hi CursorLine guibg=#262626 ctermbg=235 gui=none cterm=none
" hi CursorLineNr guifg=#ff8700 ctermfg=208 gui=none cterm=none
"else
" hi Normal guifg=#d0d0d0 ctermfg=252 guibg=#121212 ctermbg=233
" hi CursorLine guibg=#1c1c1c ctermbg=234 gui=none cterm=none
" hi CursorLineNr guifg=#ff8700 ctermfg=208 gui=none cterm=none
"endif
hi Boolean guifg=#af5fff ctermfg=135
hi Character guifg=#afaf87 ctermfg=144
hi Number guifg=#af5fff ctermfg=135
hi String guifg=#afaf87 ctermfg=144
hi Conditional guifg=#df005f ctermfg=161 gui=bold cterm=bold
hi Constant guifg=#af5fff ctermfg=135 gui=bold cterm=bold
hi Cursor guifg=#000000 ctermfg=16 guibg=#dadada ctermbg=253
hi Debug guifg=#ffdfff ctermfg=225 gui=bold cterm=bold
hi Define guifg=#5fdfff ctermfg=81
hi Delimiter guifg=#606060 ctermfg=241

hi DiffAdd guibg=#005f87 ctermbg=24
hi DiffChange guifg=#dfafaf ctermfg=181 guibg=#4e4e4e ctermbg=239
hi DiffDelete guifg=#df0087 ctermfg=162 guibg=#5f005f ctermbg=53
hi DiffText guibg=#878787 ctermbg=102 gui=bold cterm=bold

hi Directory guifg=#87ff00 ctermfg=118 gui=bold cterm=bold
hi Error guifg=#ffafff ctermfg=219 guibg=#87005f ctermbg=89
hi ErrorMsg guifg=#ff00af ctermfg=199 guibg=#000000 ctermbg=16 gui=bold cterm=bold
hi Exception guifg=#87ff00 ctermfg=118 gui=bold cterm=bold
hi Float guifg=#af5fff ctermfg=135
hi FoldColumn guifg=#5f87af ctermfg=67 guibg=#000000 ctermbg=16
hi Folded guifg=#5f87af ctermfg=67 guibg=#000000 ctermbg=16
hi Function guifg=#87ff00 ctermfg=118
hi Identifier guifg=#ff8700 ctermfg=208 gui=none cterm=none
hi Ignore guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=232
hi IncSearch guifg=#dfffaf ctermfg=193 guibg=#000000 ctermbg=16

hi keyword guifg=#df005f ctermfg=161 gui=bold cterm=bold
hi Label guifg=#ffffaf ctermfg=229 gui=none cterm=none
hi Macro guifg=#dfffaf ctermfg=193
hi SpecialKey guifg=#5fdfff ctermfg=81

hi MatchParen guifg=#121212 ctermfg=233 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi ModeMsg guifg=#ffffaf ctermfg=229
hi MoreMsg guifg=#ffffaf ctermfg=229
hi Operator guifg=#df005f ctermfg=161

" complete menu
hi Pmenu guifg=#5fdfff ctermfg=81 guibg=#000000 ctermbg=16
hi PmenuSel guifg=#eeeeee ctermfg=255 guibg=#666666 ctermbg=242
hi PmenuSbar guibg=#080808 ctermbg=232
hi PmenuThumb guifg=#5fdfff ctermfg=81

hi PreCondit guifg=#87ff00 ctermfg=118 gui=bold cterm=bold
hi PreProc guifg=#87ff00 ctermfg=118
hi Question guifg=#5fdfff ctermfg=81
hi Repeat guifg=#df005f ctermfg=161 gui=bold cterm=bold
hi Search guifg=#000000 ctermfg=0 guibg=#ffdf87 ctermbg=222 gui=NONE cterm=NONE

" marks column
hi SignColumn guifg=#87ff00 ctermfg=118 guibg=#262626 ctermbg=235
hi SpecialChar guifg=#df005f ctermfg=161 gui=bold cterm=bold
hi SpecialComment guifg=#8a8a8a ctermfg=245 gui=bold cterm=bold
hi Special guifg=#5fdfff ctermfg=81
if has("spell")
hi SpellBad guibg=#5f0000 ctermbg=52
hi SpellCap guibg=#00005f ctermbg=17
hi SpellLocal guibg=#00005f ctermbg=17
hi SpellRare ctermfg=none ctermbg=none gui=reverse cterm=reverse
endif
hi Statement guifg=#df005f ctermfg=161 gui=bold cterm=bold
hi StatusLine guifg=#444444 ctermfg=238 guibg=#dadada ctermbg=253
hi StatusLineNC guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=232
hi StorageClass guifg=#ff8700 ctermfg=208
hi Structure guifg=#5fdfff ctermfg=81
hi Tag guifg=#df005f ctermfg=161
hi Title guifg=#df5f00 ctermfg=166
hi Todo guifg=#ffffff ctermfg=231 guibg=#080808 ctermbg=232 gui=bold cterm=bold

hi Typedef guifg=#5fdfff ctermfg=81
hi Type guifg=#5fdfff ctermfg=81 gui=none cterm=none
hi Underlined guifg=#808080 ctermfg=244 gui=underline cterm=underline

hi VertSplit guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=232 gui=bold cterm=bold
hi VisualNOS guibg=#444444 ctermbg=238
hi Visual guibg=#262626 ctermbg=235
hi WarningMsg guifg=#ffffff ctermfg=231 guibg=#444444 ctermbg=238 gui=bold cterm=bold
hi WildMenu guifg=#5fdfff ctermfg=81 guibg=#000000 ctermbg=16

hi Comment guifg=#5f5f5f ctermfg=59
hi CursorColumn guibg=#303030 ctermbg=236
hi ColorColumn guibg=#303030 ctermbg=236
hi LineNr guifg=#bcbcbc ctermfg=250 ctermbg=none
hi NonText guifg=#5f5f5f ctermfg=59

hi SpecialKey guifg=#5f5f5f ctermfg=59

if exists("g:rehash256") && g:rehash256 == 1
hi Normal guifg=#d0d0d0 ctermfg=252 guibg=#1c1c1c ctermbg=234
hi CursorLine guibg=#303030 ctermbg=236 gui=none cterm=none
hi CursorLineNr guifg=#ff8700 ctermfg=208 gui=none cterm=none

hi Boolean guifg=#af87ff ctermfg=141
hi Character guifg=#ffdf87 ctermfg=222
hi Number guifg=#af87ff ctermfg=141
hi String guifg=#ffdf87 ctermfg=222
hi Conditional guifg=#ff005f ctermfg=197 gui=bold cterm=bold
hi Constant guifg=#af87ff ctermfg=141 gui=bold cterm=bold

hi DiffDelete guifg=#af005f ctermfg=125 guibg=#121212 ctermbg=233

hi Directory guifg=#afff00 ctermfg=154 gui=bold cterm=bold
hi Error guifg=#ffdf87 ctermfg=222 guibg=#121212 ctermbg=233
hi Exception guifg=#afff00 ctermfg=154 gui=bold cterm=bold
hi Float guifg=#af87ff ctermfg=141
hi Function guifg=#afff00 ctermfg=154
hi Identifier guifg=#ff8700 ctermfg=208

hi Keyword guifg=#ff005f ctermfg=197 gui=bold cterm=bold
hi Operator guifg=#ff005f ctermfg=197
hi PreCondit guifg=#afff00 ctermfg=154 gui=bold cterm=bold
hi PreProc guifg=#afff00 ctermfg=154
hi Repeat guifg=#ff005f ctermfg=197 gui=bold cterm=bold

hi Statement guifg=#ff005f ctermfg=197 gui=bold cterm=bold
hi Tag guifg=#ff005f ctermfg=197
hi Title guifg=#ff5f5f ctermfg=203
hi Visual guibg=#444444 ctermbg=238

hi Comment guifg=#808080 ctermfg=244
hi LineNr guifg=#4e4e4e ctermfg=239 ctermbg=none
hi NonText guifg=#4e4e4e ctermfg=239
hi SpecialKey guifg=#4e4e4e ctermfg=239
endif
end

" Must be at the end, because of guibg=#1c1c1c ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
" set background=dark
