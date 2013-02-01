" Vim color file - yangyin
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "yangyin"

hi IncSearch guifg=#c0c0c0 guibg=#afd7ff gui=NONE ctermfg=07 ctermbg=153 cterm=NONE
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
hi Typedef guifg=#ff5fff guibg=NONE gui=bold ctermfg=207 ctermbg=NONE cterm=bold
hi Title guifg=#ffd7af guibg=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi Folded guifg=#4e4e4e guibg=#4e4e4e gui=NONE ctermfg=239 ctermbg=239 cterm=NONE
hi PreCondit guifg=#afafff guibg=NONE gui=underline ctermfg=147 ctermbg=NONE cterm=underline
hi Include guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi Float guifg=#ff5fff guibg=#3a3a3a gui=NONE ctermfg=207 ctermbg=237 cterm=NONE
hi StatusLineNC guifg=#b2b2b2 guibg=#4e4e4e gui=NONE ctermfg=249 ctermbg=239 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#767676 guibg=#4e4e4e gui=NONE ctermfg=243 ctermbg=239 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=#ffafaf guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#ffafaf guibg=#8a8a8a gui=NONE ctermfg=217 ctermbg=245 cterm=NONE
"hi Ignore -- no settings --
hi Debug guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#b2b2b2 gui=NONE ctermfg=NONE ctermbg=249 cterm=NONE
hi Identifier guifg=#afafd7 guibg=NONE gui=bold ctermfg=146 ctermbg=NONE cterm=bold
hi Conditional guifg=#00d700 guibg=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi StorageClass guifg=#00d700 guibg=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi Todo guifg=#afafff guibg=NONE gui=bold ctermfg=147 ctermbg=NONE cterm=bold
hi Comment guifg=#767676 guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
hi LineNr guifg=#767676 guibg=#262626 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
hi StatusLine guifg=#121212 guibg=#b2b2b2 gui=NONE ctermfg=233 ctermbg=249 cterm=NONE
hi Normal guifg=#c0c0c0 guibg=#121212 gui=NONE ctermfg=07 ctermbg=233 cterm=NONE
hi Label guifg=#4e4e4e guibg=NONE gui=bold ctermfg=239 ctermbg=NONE cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#121212 guibg=#b2b2b2 gui=NONE ctermfg=233 ctermbg=249 cterm=NONE
hi Search guifg=#c0c0c0 guibg=#afd7ff gui=NONE ctermfg=07 ctermbg=153 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi Statement guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Character guifg=#afd7ff guibg=#3a3a3a gui=bold ctermfg=153 ctermbg=237 cterm=bold
"hi TabLineSel -- no settings --
hi Number guifg=#afafd7 guibg=NONE gui=NONE ctermfg=146 ctermbg=NONE cterm=NONE
hi Boolean guifg=#ffafaf guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
hi Operator guifg=#afafff guibg=NONE gui=bold ctermfg=147 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
"hi Union -- no settings --
"hi TabLineFill -- no settings --
hi Question guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ffd7af guibg=#8a8a8a gui=NONE ctermfg=223 ctermbg=245 cterm=NONE
"hi VisualNOS -- no settings --
hi DiffDelete guifg=#8a8a8a guibg=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi ModeMsg guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
"hi CursorColumn -- no settings --
hi Define guifg=#00d700 guibg=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi Function guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#4e4e4e guibg=#4e4e4e gui=NONE ctermfg=239 ctermbg=239 cterm=NONE
hi PreProc guifg=#e4e4e4 guibg=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#4e4e4e gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi MoreMsg guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
"hi SpellCap -- no settings --
hi VertSplit guifg=#b2b2b2 guibg=#b2b2b2 gui=NONE ctermfg=249 ctermbg=249 cterm=NONE
hi Exception guifg=#00d700 guibg=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi Keyword guifg=#ff5fff guibg=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Type guifg=#8a8a8a guibg=NONE gui=bold ctermfg=245 ctermbg=NONE cterm=bold
hi DiffChange guifg=#c0c0c0 guibg=NONE gui=NONE ctermfg=07 ctermbg=NONE cterm=NONE
hi Cursor guifg=#c0c0c0 guibg=#ff5fff gui=NONE ctermfg=07 ctermbg=2237 cterm=NONE
"hi SpellLocal -- no settings --
hi Error guifg=#ffafaf guibg=#3a3a3a gui=NONE ctermfg=217 ctermbg=237 cterm=NONE
hi PMenu guifg=#b2b2b2 guibg=#4e4e4e gui=NONE ctermfg=249 ctermbg=239 cterm=NONE
hi SpecialKey guifg=NONE guibg=#afafff gui=bold ctermfg=NONE ctermbg=147 cterm=bold
hi Constant guifg=#afd7ff guibg=NONE gui=bold ctermfg=153 ctermbg=NONE cterm=bold
"hi DefinedName -- no settings --
hi Tag guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#4e4e4e gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi MatchParen guifg=NONE guibg=#ffd7af gui=NONE ctermfg=NONE ctermbg=223 cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#00d700 guibg=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#ffafaf guibg=NONE gui=underline ctermfg=217 ctermbg=NONE cterm=underline
hi Structure guifg=#00d700 guibg=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi Macro guifg=#afafff guibg=NONE gui=underline ctermfg=147 ctermbg=NONE cterm=underline
hi Underlined guifg=#c0c0c0 guibg=#3a3a3a gui=underline ctermfg=07 ctermbg=237 cterm=underline
hi DiffAdd guifg=#00d700 guibg=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
"hi TabLine -- no settings --
hi javascriptstrings guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi htmlstring guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi phpstringsingle guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi colorcolumn guifg=#e4e4e4 guibg=#3a3a3a gui=NONE ctermfg=254 ctermbg=237 cterm=NONE
hi cursorlinenr guifg=#ffd7af guibg=#262626 gui=bold ctermfg=223 ctermbg=235 cterm=bold
"hi clear -- no settings --
hi SpecialComment guifg=#afafff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
hi String guifg=#afd7ff guibg=#3a3a3a gui=NONE ctermfg=153 ctermbg=237 cterm=NONE
hi Special guifg=#afd7ff guibg=#3a3a3a gui=NONE ctermfg=153 ctermbg=237 cterm=NONE
hi SpecialChar guifg=#afd7ff guibg=#3a3a3a gui=NONE ctermfg=153 ctermbg=237 cterm=NONE
