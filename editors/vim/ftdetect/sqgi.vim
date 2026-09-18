" Prefer SQGI's extended Squirrel syntax over Vim's bundled Squirrel syntax.
" Preserve explicit choices of other filetypes (for example via a modeline).
function! s:DetectSQGI(kind) abort
  if empty(&l:filetype) || &l:filetype ==# 'squirrel'
    let &l:filetype = a:kind
  endif
endfunction
augroup sqgi_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.nut call s:DetectSQGI('sqgi_squirrel')
  autocmd BufRead,BufNewFile *.sqk call s:DetectSQGI('sqgi_kernel')
augroup END
