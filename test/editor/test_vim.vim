" Run with: vim -Nu NONE -n -es -S test/editor/test_vim.vim
set nomore
let s:root = fnamemodify(expand('<sfile>:p'), ':h:h:h')
execute 'set runtimepath^=' . fnameescape(s:root . '/editors/vim')
filetype on
syntax on

function! s:Group(line, text, expected) abort
  let col = stridx(getline(a:line), a:text) + 1
  call assert_true(col > 0, 'Missing test text: ' . a:text)
  call assert_equal(a:expected, synIDattr(synID(a:line, col, 1), 'name'), a:text)
endfunction

new sqgi-editor-test.nut
call assert_equal('sqgi_squirrel', &filetype)
call setline(1, ['async function advance(dt) {',
      \ '  local x = 0xFF + 1.25e-3; await Task();',
      \ '  local s = @"first ""quoted""',
      \ '    // still a string',
      \ '    last"; return true;',
      \ '  /* local false',
      \ '     await */ print("escaped \" quote");',
      \ '  # await false',
      \ "  local c = 'x'; // return", '}',
      \ 'local txt = "unterminated', 'return null;'])
call s:Group(1, 'async', 'sqgiKeyword')
call s:Group(1, 'advance', 'sqgiFunction')
call s:Group(2, '0xFF', 'sqgiNumber')
call s:Group(2, '1.25e-3', 'sqgiNumber')
call s:Group(2, '+', 'sqgiOperator')
call s:Group(2, 'await', 'sqgiKeyword')
call s:Group(2, 'Task', 'sqgiBuiltin')
call s:Group(3, 'quoted', 'sqgiVerbatim')
call s:Group(4, '//', 'sqgiVerbatim')
call s:Group(5, 'last', 'sqgiVerbatim')
call s:Group(5, 'return', 'sqgiKeyword')
call s:Group(5, 'true', 'sqgiConstant')
call s:Group(6, 'local', 'sqgiComment')
call s:Group(7, 'await', 'sqgiComment')
call s:Group(7, 'print', 'sqgiBuiltin')
call s:Group(7, '\"', 'sqgiEscape')
call s:Group(7, 'quote', 'sqgiString')
call s:Group(8, 'await', 'sqgiComment')
call s:Group(9, "'x'", 'sqgiCharacter')
call s:Group(9, 'return', 'sqgiComment')
call s:Group(12, 'return', 'sqgiKeyword')

new sqgi-editor-test.sqk
call assert_equal('sqgi_kernel', &filetype)
call setline(1, ['export f64 length(f64 x) {',
      \ '  require(isfinite(x)); return sqrt(x) % .5;',
      \ '}', 'struct Point { i64 x; bool valid; };',
      \ '// sqrt(f64)', 'f64 sqrtish = 1;'])
call s:Group(1, 'export', 'sqgiKeyword')
call s:Group(1, 'f64', 'sqgiType')
call s:Group(1, 'length', 'sqgiFunction')
call s:Group(2, 'require', 'sqgiKeyword')
call s:Group(2, 'isfinite', 'sqgiBuiltin')
call s:Group(2, 'sqrt', 'sqgiBuiltin')
call s:Group(2, '%', 'sqgiOperator')
call s:Group(2, '.5', 'sqgiNumber')
call s:Group(4, 'struct', 'sqgiKeyword')
call s:Group(4, 'i64', 'sqgiType')
call s:Group(4, 'bool', 'sqgiType')
call s:Group(5, 'sqrt', 'sqgiComment')
call s:Group(6, 'sqrtish', '')
setlocal filetype=text
doautocmd BufRead sqgi-editor-test.sqk
call assert_equal('text', &filetype)

" Exercise BufRead independently of BufNewFile and syntax reloading.
new
setlocal filetype=squirrel
doautocmd BufRead sqgi-editor-test.nut
call assert_equal('sqgi_squirrel', &filetype)
call assert_equal('sqgi_squirrel', b:current_syntax)
if !empty(v:errors)
  for error in v:errors
    echomsg error
  endfor
  cquit
endif
qa!
