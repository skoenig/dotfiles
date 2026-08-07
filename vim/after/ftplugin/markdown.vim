" Markdown on top of Vim's runtime files. vim-markdown was dropped: it calls
" synID() per line from 'foldexpr' and 'indentexpr' and rescans the whole buffer
" on InsertEnter/CursorHold, which freezes for seconds on long documents.
" https://github.com/preservim/vim-markdown/issues/162

" --- folding per header -------------------------------------------------------
" Vim's own MarkdownFold() would do this in one line (g:markdown_folding), but it
" calls synID() per heading to skip fenced code: 299 ms per full fold compute on
" a 1200-line file vs 15 ms here. Fenced regions are found once per change
" instead. ponytail: ATX (#) headings only, no setext.

" Line numbers inside fenced code blocks, cached per buffer change.
function! s:FencedLines() abort
  if get(b:, 'md_fence_tick', -1) == b:changedtick
    return b:md_fence_lines
  endif
  let l:fenced = {}
  let l:open = 0
  for l:m in matchbufline(bufnr(), '^\s*\%(`\{3,}\|\~\{3,}\)', 1, '$')
    if l:open
      for l:n in range(l:open + 1, l:m.lnum - 1)
        let l:fenced[l:n] = 1
      endfor
      let l:open = 0
    else
      let l:open = l:m.lnum
    endif
  endfor
  let b:md_fence_lines = l:fenced
  let b:md_fence_tick = b:changedtick
  return l:fenced
endfunction

function! MarkdownHeadingFold(lnum) abort
  let l:hashes = matchstr(getline(a:lnum), '^#\+\ze\s')
  if !empty(l:hashes) && !has_key(s:FencedLines(), a:lnum)
    return '>' . strlen(l:hashes)
  endif
  return '='
endfunction

" matchbufline() is Vim 9.1.0009+; older Vim keeps the runtime's own folding.
function! s:SetupFolding() abort
  if !exists('*matchbufline') | return | endif
  setlocal foldmethod=expr
  setlocal foldexpr=MarkdownHeadingFold(v:lnum)
  setlocal foldtext=MarkdownFoldText()
endfunction

call s:SetupFolding()

" 'viewoptions' has "folds", which saves the local fold options into the view.
" loadview runs on BufWinEnter, after this file, so a stale view can restore a
" 'foldexpr' naming a function that no longer exists (E490: No fold found).
augroup markdown_folding_reassert
  autocmd! * <buffer>
  autocmd BufWinEnter <buffer> call s:SetupFolding()
augroup END

" --- :TableFormat -------------------------------------------------------------
" From vim-markdown (MIT, © 2009 Benjamin D. Williams). Needs godlygeek/tabular.
function! s:TableFormat() abort
  let l:pos = getpos('.')
  normal! {
  " Search rather than `normal! j`, for a table at the very start of the file.
  call search('|')
  " Tabularize pads around the first '|', so remember the indent and restore it
  " afterwards or the table creeps one space right on every run.
  let l:first = line('.')
  let l:indent = matchstr(getline(l:first), '^\s*')
  let l:last = l:first
  while l:last < line('$') && getline(l:last + 1) =~# '|'
    let l:last += 1
  endwhile
  normal! j
  " Strip everything that is not a pipe, colon or hyphen next to a colon, else
  " the separator row grows by 2 spaces on every run.
  let l:flags = (&gdefault ? '' : 'g')
  execute 's/\(:\@<!-:\@!\|[^|:-]\)//e' . l:flags
  execute 's/--/-/e' . l:flags
  Tabularize /\(\\\)\@<!|
  " Move alignment colons to the outer edge of the cell.
  execute 's/:\( \+\)|/\1:|/e' . l:flags
  execute 's/|\( \+\):/|:\1/e' . l:flags
  execute 's/|:\?\zs[ -]\+\ze:\?|/\=repeat("-", len(submatch(0)))/' . l:flags
  execute 'silent ' . l:first . ',' . l:last . 's/^\s*\ze|/' . escape(l:indent, '/\&~') . '/e'
  call setpos('.', l:pos)
endfunction

if exists(':Tabularize') == 2
  command! -buffer -range TableFormat call s:TableFormat()
endif
