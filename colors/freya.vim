" Vim color file - freya
" Generated by http://bytefluent.com/vivify 2013-05-13
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "freya"

hi IncSearch guifg=#dcdccc guibg=#866a4f guisp=#866a4f gui=NONE ctermfg=187 ctermbg=95 cterm=NONE
hi WildMenu guifg=#2a2a2a guibg=#c0aa94 guisp=#c0aa94 gui=bold ctermfg=235 ctermbg=138 cterm=bold
hi SignColumn guifg=#c2b680 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=186 ctermbg=235 cterm=NONE
hi SpecialComment guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi Typedef guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi Title guifg=#f7f7f1 guibg=#000000 guisp=#000000 gui=bold ctermfg=230 ctermbg=NONE cterm=bold
hi Folded guifg=#c2b680 guibg=#101010 guisp=#101010 gui=NONE ctermfg=186 ctermbg=233 cterm=NONE
hi PreCondit guifg=#c2aed0 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=182 ctermbg=235 cterm=NONE
hi Include guifg=#c2aed0 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=182 ctermbg=235 cterm=NONE
hi TabLineSel guifg=#f7f7f1 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=230 ctermbg=235 cterm=bold
hi StatusLineNC guifg=#f7f7f1 guibg=#564d43 guisp=#564d43 gui=NONE ctermfg=230 ctermbg=240 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#9f8f80 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=138 ctermbg=235 cterm=bold
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=#dcdccc guibg=#0000cd guisp=#0000cd gui=bold ctermfg=187 ctermbg=20 cterm=bold
hi ErrorMsg guifg=#f07070 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=210 ctermbg=235 cterm=bold
hi Ignore guifg=#2a2a2a guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
hi Debug guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi PMenuSbar guifg=#dcdccc guibg=#B99F86 guisp=#B99F86 gui=NONE ctermfg=187 ctermbg=138 cterm=NONE
hi Identifier guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=181 ctermbg=235 cterm=NONE
hi SpecialChar guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi Conditional guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi StorageClass guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi Todo guifg=#2a2a2a guibg=#aed0ae guisp=#aed0ae gui=NONE ctermfg=235 ctermbg=151 cterm=NONE
hi Special guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi LineNr guifg=#9f8f80 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
hi StatusLine guifg=#f7f7f1 guibg=#736559 guisp=#736559 gui=bold ctermfg=230 ctermbg=95 cterm=bold
hi Normal guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
hi Label guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#2a2a2a guibg=#c0aa94 guisp=#c0aa94 gui=NONE ctermfg=235 ctermbg=138 cterm=NONE
hi Search guifg=#2a2a2a guibg=#c0aa94 guisp=#c0aa94 gui=NONE ctermfg=235 ctermbg=138 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi Statement guifg=#e0af91 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=180 ctermbg=235 cterm=bold
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#c2b680 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=186 ctermbg=235 cterm=NONE
hi Character guifg=#afe091 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=150 ctermbg=235 cterm=NONE
"hi Float -- no settings --
hi Number guifg=#afe091 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=150 ctermbg=235 cterm=NONE
hi Boolean guifg=#e0af91 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=180 ctermbg=235 cterm=bold
hi Operator guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi CursorLine guifg=NONE guibg=#3f3f3f guisp=#3f3f3f gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
"hi Union -- no settings --
hi TabLineFill guifg=#f7f7f1 guibg=#564d43 guisp=#564d43 gui=underline ctermfg=230 ctermbg=240 cterm=underline
hi Question guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi WarningMsg guifg=#f07070 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=210 ctermbg=235 cterm=NONE
hi VisualNOS guifg=#c0aa94 guibg=#2a2a2a guisp=#2a2a2a gui=bold,underline ctermfg=138 ctermbg=235 cterm=bold,underline
hi DiffDelete guifg=#dcdccc guibg=#8b0000 guisp=#8b0000 gui=NONE ctermfg=187 ctermbg=88 cterm=NONE
hi ModeMsg guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=187 ctermbg=235 cterm=bold
hi CursorColumn guifg=NONE guibg=#3f3f3f guisp=#3f3f3f gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi Define guifg=#c2aed0 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=182 ctermbg=235 cterm=NONE
hi Function guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=181 ctermbg=235 cterm=NONE
hi FoldColumn guifg=#c2b680 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=186 ctermbg=235 cterm=NONE
hi PreProc guifg=#c2aed0 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=182 ctermbg=235 cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=#000000 guibg=#5f5f5f guisp=#5f5f5f gui=NONE ctermfg=NONE ctermbg=59 cterm=NONE
hi MoreMsg guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
"hi SpellCap -- no settings --
hi VertSplit guifg=#f7f7f1 guibg=#564d43 guisp=#564d43 gui=NONE ctermfg=230 ctermbg=240 cterm=NONE
hi Exception guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi Keyword guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi Type guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi DiffChange guifg=#dcdccc guibg=#00008b guisp=#00008b gui=NONE ctermfg=187 ctermbg=18 cterm=NONE
hi Cursor guifg=#2a2a2a guibg=#dcdccc guisp=#dcdccc gui=NONE ctermfg=235 ctermbg=187 cterm=NONE
"hi SpellLocal -- no settings --
hi Error guifg=#f07070 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=210 ctermbg=235 cterm=NONE
hi PMenu guifg=#000000 guibg=#a78869 guisp=#a78869 gui=NONE ctermfg=NONE ctermbg=137 cterm=NONE
hi SpecialKey guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi Constant guifg=#afe091 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=150 ctermbg=235 cterm=NONE
"hi DefinedName -- no settings --
hi Tag guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi String guifg=#afe091 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=150 ctermbg=235 cterm=NONE
hi PMenuThumb guifg=#2a2a2a guibg=#f7f7f1 guisp=#f7f7f1 gui=NONE ctermfg=235 ctermbg=230 cterm=NONE
hi MatchParen guifg=NONE guibg=#008b8b guisp=#008b8b gui=NONE ctermfg=NONE ctermbg=30 cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=179 ctermbg=235 cterm=NONE
hi Structure guifg=#dabfa5 guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=181 ctermbg=235 cterm=bold
hi Macro guifg=#c2aed0 guibg=#2a2a2a guisp=#2a2a2a gui=NONE ctermfg=182 ctermbg=235 cterm=NONE
hi Underlined guifg=#d4b064 guibg=#2a2a2a guisp=#2a2a2a gui=underline ctermfg=179 ctermbg=235 cterm=underline
hi DiffAdd guifg=#dcdccc guibg=#008b00 guisp=#008b00 gui=NONE ctermfg=187 ctermbg=28 cterm=NONE
hi TabLine guifg=#f7f7f1 guibg=#564d43 guisp=#564d43 gui=underline ctermfg=230 ctermbg=240 cterm=underline
hi cursorim guifg=#101520 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=234 ctermbg=7 cterm=NONE
"hi clear -- no settings --
hi pythonbuiltin guifg=#839496 guibg=NONE guisp=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi phpstringdouble guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#4aa04a guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi javascriptstrings guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi htmlstring guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi phpstringsingle guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi debug guifg=#ffffff guibg=#006400 guisp=#006400 gui=NONE ctermfg=15 ctermbg=22 cterm=NONE
hi warningmsg guifg=#ffffff guibg=#00008b guisp=#00008b gui=NONE ctermfg=15 ctermbg=18 cterm=NONE
hi ifdefifout guifg=#a9a9a9 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi xmltag guifg=#E8BF6A guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi xmlattrib guifg=#007C00 guibg=NONE guisp=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi xmltagname guifg=#E8BF6A guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi xmlcomment guifg=#7F7F7F guibg=NONE guisp=NONE gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi xmlentity guifg=#99006B guibg=NONE guisp=NONE gui=NONE ctermfg=89 ctermbg=NONE cterm=NONE
hi xmlendtag guifg=#E8BF6A guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi lcursor guifg=#2a2a2a guibg=#c0aa94 guisp=#c0aa94 gui=NONE ctermfg=235 ctermbg=138 cterm=NONE
hi htmlitalic guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=italic ctermfg=187 ctermbg=235 cterm=NONE
hi htmlboldunderlineitalic guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=bold,italic,underline ctermfg=187 ctermbg=235 cterm=bold,underline
hi htmlbolditalic guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=bold,italic ctermfg=187 ctermbg=235 cterm=bold
hi htmlunderlineitalic guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=italic,underline ctermfg=187 ctermbg=235 cterm=underline
hi htmlbold guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=187 ctermbg=235 cterm=bold
hi htmlboldunderline guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=bold,underline ctermfg=187 ctermbg=235 cterm=bold,underline
hi htmlunderline guifg=#dcdccc guibg=#2a2a2a guisp=#2a2a2a gui=underline ctermfg=187 ctermbg=235 cterm=underline
hi mailsubject guifg=#A5C261 guibg=NONE guisp=NONE gui=NONE ctermfg=107 ctermbg=NONE cterm=NONE
hi rubylocalvariableormethod guifg=#D0D0FF guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi rubyblockparameter guifg=#FFFFFF guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi rubyclass guifg=#447799 guibg=NONE guisp=NONE gui=NONE ctermfg=67 ctermbg=NONE cterm=NONE
hi rubyconstant guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi rubypseudovariable guifg=#005fff guibg=NONE guisp=NONE gui=NONE ctermfg=27 ctermbg=NONE cterm=NONE
hi rubyinstancevariable guifg=#c6b6fe guibg=NONE guisp=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi mailheaderkey guifg=#FFC66D guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubystringdelimiter guifg=#005fff guibg=NONE guisp=NONE gui=NONE ctermfg=27 ctermbg=NONE cterm=NONE
hi mailemail guifg=#A5C261 guibg=NONE guisp=NONE gui=italic,underline ctermfg=107 ctermbg=NONE cterm=underline
hi rubyinterpolation guifg=#5fd787 guibg=NONE guisp=NONE gui=NONE ctermfg=78 ctermbg=NONE cterm=NONE
hi rubypredefinedconstant guifg=#DA4939 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi type guifg=#84A7C1 guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
"hi vimhigroup -- no settings --
hi taglistcomment guifg=#000000 guibg=#008700 guisp=#008700 gui=NONE ctermfg=NONE ctermbg=28 cterm=NONE
hi taglisttitle guifg=#ff00af guibg=#000000 guisp=#000000 gui=NONE ctermfg=199 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#000000 guibg=#008700 guisp=#008700 gui=NONE ctermfg=NONE ctermbg=28 cterm=NONE
hi user4 guifg=#00ffdf guibg=#0000df guisp=#0000df gui=NONE ctermfg=50 ctermbg=20 cterm=NONE
hi user5 guifg=#00ff00 guibg=#0000df guisp=#0000df gui=NONE ctermfg=10 ctermbg=20 cterm=NONE
hi user2 guifg=#00ff00 guibg=#0000df guisp=#0000df gui=NONE ctermfg=10 ctermbg=20 cterm=NONE
hi user3 guifg=#00ff00 guibg=#0000df guisp=#0000df gui=NONE ctermfg=10 ctermbg=20 cterm=NONE
hi user1 guifg=#ffffff guibg=#0000df guisp=#0000df gui=NONE ctermfg=15 ctermbg=20 cterm=NONE
hi taglistfilename guifg=#ffffff guibg=#870087 guisp=#870087 gui=NONE ctermfg=15 ctermbg=90 cterm=NONE
hi taglisttagscope guifg=#000000 guibg=#008700 guisp=#008700 gui=NONE ctermfg=NONE ctermbg=28 cterm=NONE
"hi semicolon -- no settings --
hi javaparen2 guifg=#a0c0ff guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi javaparen1 guifg=#80a0ff guibg=NONE guisp=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi javabraces guifg=#406090 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi javaparen guifg=#6080e0 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi javaexternal guifg=#666666 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
hi javafuncdef guifg=#b53423 guibg=NONE guisp=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
hi javalangobject guifg=#6080c0 guibg=NONE guisp=NONE gui=NONE ctermfg=67 ctermbg=NONE cterm=NONE
hi javascopedecl guifg=#854433 guibg=NONE guisp=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi literal guifg=#0000ff guibg=NONE guisp=NONE gui=NONE ctermfg=21 ctermbg=NONE cterm=NONE
hi jinjafilter guifg=#ff0086 guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=198 ctermbg=230 cterm=NONE
hi pythondoctest2 guifg=#3b916a guibg=NONE guisp=NONE gui=NONE ctermfg=72 ctermbg=NONE cterm=NONE
hi jinjaraw guifg=#aaaaaa guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=248 ctermbg=230 cterm=NONE
hi htmltagn guifg=#4aa04a guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi pythonexception guifg=#ee0000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi jinjaoperator guifg=#ffffff guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=15 ctermbg=230 cterm=NONE
hi jinjavarblock guifg=#ff0007 guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=196 ctermbg=230 cterm=NONE
hi jinjaattribute guifg=#dd7700 guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=172 ctermbg=230 cterm=NONE
hi pythondoctest guifg=#2f5f49 guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
hi jinjastring guifg=#0086d2 guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=32 ctermbg=230 cterm=NONE
hi htmlspecialtagname guifg=#4aa04a guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi pythonfunction guifg=#ee0000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
"hi pythonspaceerror -- no settings --
hi jinjacomment guifg=#008800 guibg=#002300 guisp=#002300 gui=italic ctermfg=28 ctermbg=22 cterm=NONE
hi jinjanumber guifg=#bf0945 guibg=#fbf4c7 guisp=#fbf4c7 gui=bold ctermfg=1 ctermbg=230 cterm=bold
hi pythoncoding guifg=#ff0086 guibg=NONE guisp=NONE gui=NONE ctermfg=198 ctermbg=NONE cterm=NONE
hi jinjatagblock guifg=#ff0007 guibg=#fbf4c7 guisp=#fbf4c7 gui=bold ctermfg=196 ctermbg=230 cterm=bold
hi jinjastatement guifg=#fb660a guibg=#fbf4c7 guisp=#fbf4c7 gui=bold ctermfg=202 ctermbg=230 cterm=bold
hi pythonbuiltinfunc guifg=#2b6ba2 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi htmltag guifg=#00bdec guibg=NONE guisp=NONE gui=NONE ctermfg=45 ctermbg=NONE cterm=NONE
hi pythonrun guifg=#ff0086 guibg=NONE guisp=NONE gui=NONE ctermfg=198 ctermbg=NONE cterm=NONE
hi pythonclass guifg=#ff0086 guibg=NONE guisp=NONE gui=NONE ctermfg=198 ctermbg=NONE cterm=NONE
hi pythonexclass guifg=#66cd66 guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
hi pythonbuiltinobj guifg=#2b6ba2 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi jinjaspecial guifg=#008ffd guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=33 ctermbg=230 cterm=NONE
hi htmlendtag guifg=#00bdec guibg=NONE guisp=NONE gui=NONE ctermfg=45 ctermbg=NONE cterm=NONE
hi jinjavariable guifg=#92cd35 guibg=#fbf4c7 guisp=#fbf4c7 gui=NONE ctermfg=149 ctermbg=230 cterm=NONE
hi pmenum guifg=#585858 guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=240 ctermbg=234 cterm=NONE
hi condtional guifg=#8fffff guibg=NONE guisp=NONE gui=NONE ctermfg=123 ctermbg=NONE cterm=NONE
hi keyword guifg=#FFDE00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi normal guifg=#e8e8d3 guibg=#151515 guisp=#151515 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE
hi constant guifg=#cf6a4c guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi menu guifg=#000000 guibg=#bebebe guisp=#bebebe gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
hi scrollbar guifg=#a9a9a9 guibg=#a9a9a9 guisp=#a9a9a9 gui=NONE ctermfg=248 ctermbg=248 cterm=NONE
hi djangostatement guifg=#005f00 guibg=#ddffaa guisp=#ddffaa gui=NONE ctermfg=22 ctermbg=193 cterm=NONE
hi doctrans guifg=#ffffff guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=15 ctermbg=15 cterm=NONE
hi helpnote guifg=#000000 guibg=#ffd700 guisp=#ffd700 gui=NONE ctermfg=NONE ctermbg=220 cterm=NONE
hi doccode guifg=#00aa00 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi docspecial guifg=#4876ff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi htmlstatement guifg=#af5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=132 ctermbg=NONE cterm=NONE
hi sourceline guifg=#88bbff guibg=#000038 guisp=#000038 gui=NONE ctermfg=111 ctermbg=17 cterm=NONE
hi javaexceptions guifg=#dc9a88 guibg=NONE guisp=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi bufexploreractbuf guifg=#424298 guibg=#000020 guisp=#000020 gui=NONE ctermfg=61 ctermbg=17 cterm=NONE
hi bufexplorertogglesplit guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi mytaglisttagscope guifg=#589bcf guibg=#000028 guisp=#000028 gui=NONE ctermfg=74 ctermbg=17 cterm=NONE
hi level14c guifg=#ccaa88 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
hi bufexplorertitle guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi level8c guifg=#ffddbb guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi mytaglistcomment guifg=#589bcf guibg=#000028 guisp=#000028 gui=NONE ctermfg=74 ctermbg=17 cterm=NONE
hi bufexplorersorttype guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi bufexplorermapping guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi spellerrors guifg=#ffffff guibg=#ff0000 guisp=#ff0000 gui=NONE ctermfg=15 ctermbg=196 cterm=NONE
hi bufexploreropenin guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi level11c guifg=#ffddbb guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi bufexplorerbufnbr guifg=#222288 guibg=#000030 guisp=#000030 gui=NONE ctermfg=18 ctermbg=17 cterm=NONE
hi level7c guifg=#8b008b guibg=NONE guisp=NONE gui=NONE ctermfg=90 ctermbg=NONE cterm=NONE
hi level16c guifg=#aa8866 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi javaclassdecl guifg=#be7012 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi javatypedef guifg=#a63322 guibg=NONE guisp=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
hi level6c guifg=#8b0000 guibg=NONE guisp=NONE gui=NONE ctermfg=88 ctermbg=NONE cterm=NONE
hi mytaglistfilename guifg=#88bbff guibg=#000028 guisp=#000028 gui=NONE ctermfg=111 ctermbg=17 cterm=NONE
hi level1c guifg=#775533 guibg=NONE guisp=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi level15c guifg=#bb9977 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi bufexplorerlockedbuf guifg=#222288 guibg=#000030 guisp=#000030 gui=NONE ctermfg=18 ctermbg=17 cterm=NONE
hi bufexplorermodbuf guifg=#222288 guibg=#000030 guisp=#000030 gui=NONE ctermfg=18 ctermbg=17 cterm=NONE
hi level9c guifg=#eeccaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi bufexplorerhelp guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi javadebug guifg=#689879 guibg=NONE guisp=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
hi javadoccomment guifg=#88b899 guibg=NONE guisp=NONE gui=NONE ctermfg=108 ctermbg=NONE cterm=NONE
hi level5c guifg=#008b8b guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi bufexplorertoggleopen guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi bufexplorersortby guifg=NONE guibg=#000030 guisp=#000030 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi level10c guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi bufexplorercurbuf guifg=#ffffff guibg=#000030 guisp=#000030 gui=NONE ctermfg=15 ctermbg=17 cterm=NONE
hi level4c guifg=#006400 guibg=NONE guisp=NONE gui=NONE ctermfg=22 ctermbg=NONE cterm=NONE
hi bufexplorerhidbuf guifg=#222288 guibg=#000030 guisp=#000030 gui=NONE ctermfg=18 ctermbg=17 cterm=NONE
hi bufexplorerunlbuf guifg=#222288 guibg=#000030 guisp=#000030 gui=NONE ctermfg=18 ctermbg=17 cterm=NONE
hi mytaglisttagname guifg=#88bbff guibg=#000028 guisp=#000028 gui=NONE ctermfg=111 ctermbg=17 cterm=NONE
hi level12c guifg=#eeccaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi bufexplorerxxxbuf guifg=#8888ff guibg=#101070 guisp=#101070 gui=NONE ctermfg=105 ctermbg=17 cterm=NONE
hi level3c guifg=#a9a9a9 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi mytaglisttitle guifg=#88bbff guibg=#000028 guisp=#000028 gui=NONE ctermfg=111 ctermbg=17 cterm=NONE
hi level13c guifg=#ddbb99 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
hi level2c guifg=#00008b guibg=NONE guisp=NONE gui=NONE ctermfg=18 ctermbg=NONE cterm=NONE
hi bufexploreraltbuf guifg=#8888ff guibg=#101070 guisp=#101070 gui=NONE ctermfg=105 ctermbg=17 cterm=NONE
hi javastring guifg=#b87849 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi javarepeat guifg=#bcba88 guibg=NONE guisp=NONE gui=NONE ctermfg=144 ctermbg=NONE cterm=NONE
hi stringdelimiter guifg=#556633 guibg=NONE guisp=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
hi rubyregexp guifg=#dd0093 guibg=NONE guisp=NONE gui=NONE ctermfg=162 ctermbg=NONE cterm=NONE
hi string guifg=#cae682 guibg=NONE guisp=NONE gui=italic ctermfg=150 ctermbg=NONE cterm=NONE
hi identifier guifg=#c9ceff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi comment guifg=#888888 guibg=NONE guisp=NONE gui=italic ctermfg=102 ctermbg=NONE cterm=NONE
hi rubyregexpdelimiter guifg=#540063 guibg=NONE guisp=NONE gui=NONE ctermfg=53 ctermbg=NONE cterm=NONE
hi rubyregexpspecial guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi rubypredefinedidentifier guifg=#de5577 guibg=NONE guisp=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi function guifg=#fad07a guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi directory guifg=#dad085 guibg=NONE guisp=NONE gui=NONE ctermfg=186 ctermbg=NONE cterm=NONE
hi rubysymbol guifg=#005fff guibg=NONE guisp=NONE gui=NONE ctermfg=27 ctermbg=NONE cterm=NONE
hi rubycontrol guifg=#7597c6 guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi rubyidentifier guifg=#c6b6fe guibg=NONE guisp=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
"hi default -- no settings --
hi char guifg=#9090f0 guibg=#101520 guisp=#101520 gui=NONE ctermfg=105 ctermbg=234 cterm=NONE
