" Vim color file - yinyang
set background=light
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "yinyang"

hi IncSearch guifg=#3a3a3a guibg=#afd7ff gui=NONE ctermfg=237 ctermbg=153 cterm=NONE
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
hi Typedef guifg=#d700d7 guibg=NONE gui=bold ctermfg=164 ctermbg=NONE cterm=bold
hi Title guifg=#ffaf5f guibg=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#b2b2b2 guibg=#e4e4e4 gui=NONE ctermfg=249 ctermbg=254 cterm=NONE
hi Folded guifg=#b2b2b2 guibg=#e4e4e4 gui=NONE ctermfg=249 ctermbg=254 cterm=NONE
hi PreCondit guifg=#5f5fff guibg=NONE gui=underline ctermfg=63 ctermbg=NONE cterm=underline
hi Include guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi Float guifg=#d700d7 guibg=#c0c0c0 gui=NONE ctermfg=164 ctermbg=7 cterm=NONE
hi StatusLineNC guifg=#4e4e4e guibg=#b2b2b2 gui=NONE ctermfg=239 ctermbg=249 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#8a8a8a guibg=#b2b2b2 gui=NONE ctermfg=245 ctermbg=249 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=#ff5f5f guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#ff5f5f guibg=#767676 gui=NONE ctermfg=203 ctermbg=243 cterm=NONE
"hi Ignore -- no settings --
hi Debug guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#4e4e4e gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi Identifier guifg=#5f5faf guibg=NONE gui=bold ctermfg=61 ctermbg=NONE cterm=bold
hi Conditional guifg=#00af00 guibg=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi StorageClass guifg=#00af00 guibg=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi Todo guifg=#5f5fff guibg=NONE gui=bold ctermfg=63 ctermbg=NONE cterm=bold
hi Comment guifg=#8a8a8a guibg=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi LineNr guifg=#8a8a8a guibg=#d0d0d0 gui=NONE ctermfg=245 ctermbg=252 cterm=NONE
hi StatusLine guifg=#e4e4e4 guibg=#4e4e4e gui=NONE ctermfg=254 ctermbg=239 cterm=NONE
hi Normal guifg=#3a3a3a guibg=#e4e4e4 gui=NONE ctermfg=237 ctermbg=254 cterm=NONE
hi Label guifg=#b2b2b2 guibg=NONE gui=bold ctermfg=249 ctermbg=NONE cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#e4e4e4 guibg=#4e4e4e gui=NONE ctermfg=254 ctermbg=239 cterm=NONE
hi Search guifg=#3a3a3a guibg=#afd7ff gui=NONE ctermfg=237 ctermbg=153 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi Statement guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Character guifg=#5fafff guibg=#c0c0c0 gui=bold ctermfg=75 ctermbg=7 cterm=bold
"hi TabLineSel -- no settings --
hi Number guifg=#5f5faf guibg=NONE gui=NONE ctermfg=61 ctermbg=NONE cterm=NONE
hi Boolean guifg=#ff5f5f guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi Operator guifg=#5f5fff guibg=NONE gui=bold ctermfg=63 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
"hi Union -- no settings --
"hi TabLineFill -- no settings --
hi Question guifg=#afd7ff guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ffaf5f guibg=#767676 gui=NONE ctermfg=215 ctermbg=243 cterm=NONE
"hi VisualNOS -- no settings --
hi DiffDelete guifg=#767676 guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
hi ModeMsg guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
"hi CursorColumn -- no settings --
hi Define guifg=#00af00 guibg=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Function guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi PreProc guifg=#121212 guibg=NONE gui=NONE ctermfg=233 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#b2b2b2 gui=NONE ctermfg=NONE ctermbg=249 cterm=NONE
hi MoreMsg guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
"hi SpellCap -- no settings --
hi VertSplit guifg=#4e4e4e guibg=#4e4e4e gui=NONE ctermfg=239 ctermbg=239 cterm=NONE
hi Exception guifg=#00af00 guibg=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi Keyword guifg=#d700d7 guibg=NONE gui=NONE ctermfg=164 ctermbg=NONE cterm=NONE
hi Type guifg=#767676 guibg=NONE gui=bold ctermfg=243 ctermbg=NONE cterm=bold
hi DiffChange guifg=#3a3a3a guibg=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
hi Cursor guifg=#3a3a3a guibg=#ff5fff gui=NONE ctermfg=237 ctermbg=207 cterm=NONE
"hi SpellLocal -- no settings --
hi Error guifg=#ff5f5f guibg=#c0c0c0 gui=NONE ctermfg=203 ctermbg=7 cterm=NONE
hi PMenu guifg=#4e4e4e guibg=#b2b2b2 gui=NONE ctermfg=239 ctermbg=249 cterm=NONE
hi SpecialKey guifg=NONE guibg=#5f5fff gui=bold ctermfg=NONE ctermbg=63 cterm=bold
hi Constant guifg=#5fafff guibg=NONE gui=bold ctermfg=75 ctermbg=NONE cterm=bold
"hi DefinedName -- no settings --
hi Tag guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#b2b2b2 gui=NONE ctermfg=NONE ctermbg=249 cterm=NONE
hi MatchParen guifg=NONE guibg=#ffaf5f gui=NONE ctermfg=NONE ctermbg=215 cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#00af00 guibg=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#ff5f5f guibg=NONE gui=underline ctermfg=203 ctermbg=NONE cterm=underline
hi Structure guifg=#00af00 guibg=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi Macro guifg=#5f5fff guibg=NONE gui=underline ctermfg=63 ctermbg=NONE cterm=underline
hi Underlined guifg=#3a3a3a guibg=#c0c0c0 gui=underline ctermfg=237 ctermbg=7 cterm=underline
hi DiffAdd guifg=#00af00 guibg=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
"hi TabLine -- no settings --
hi javascriptstrings guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
hi htmlstring guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
hi phpstringsingle guifg=#5fafff guibg=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=NONE
hi colorcolumn guifg=#121212 guibg=#c0c0c0 gui=NONE ctermfg=233 ctermbg=7 cterm=NONE
hi cursorlinenr guifg=#ffaf5f guibg=#d0d0d0 gui=bold ctermfg=215 ctermbg=252 cterm=bold
"hi clear -- no settings --
hi SpecialComment guifg=#5f5fff guibg=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
hi String guifg=#5fafff guibg=#c0c0c0 gui=NONE ctermfg=75 ctermbg=7 cterm=NONE
hi Special guifg=#5fafff guibg=#c0c0c0 gui=NONE ctermfg=75 ctermbg=7 cterm=NONE
hi SpecialChar guifg=#5fafff guibg=#c0c0c0 gui=NONE ctermfg=75 ctermbg=7 cterm=NONE
