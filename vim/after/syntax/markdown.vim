" Gaps in Vim's runtime markdown syntax. Static rules, no per-redraw cost.

" The runtime only matches <angle> autolinks and [](links), not bare URLs.
syntax match markdownBareUrl `\v<(https?|ftp|file)://[^[:space:]'"<>`]+` contains=@NoSpell

syntax match markdownCheckbox "\%(^\s*[-*+] \)\@<=\[[ .oOxX]\]"

" The runtime colours only the '>' marker, not the quoted text. markdownUrl is
" deliberately not in 'contains': the runtime defines it as a loose "\S\+"
" reachable via nextgroup, so it would swallow the first word of every line.
syntax match markdownQuotedLine "^\s*>.*$"
  \ contains=markdownBlockquote,markdownBold,markdownItalic,markdownCode,
  \ markdownLinkText,markdownBareUrl,markdownAutomaticLink,@Spell

highlight default link markdownQuotedLine Comment
highlight default link markdownCheckbox   Statement

" Plain 'link', not 'default': the colorscheme already links markdownUrl.
highlight link markdownBareUrl       Underlined
highlight link markdownUrl           Underlined
highlight link markdownAutomaticLink Underlined
