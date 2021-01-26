" .vimrc
"--------------------------------------------------------------------------
" @author  | Artem
" @email   | artem.teleshev@gmail.com
" @site    | http://phpsw.net
" @version | 1.0.0
"--------------------------------------------------------------------------

syntax on              " - enable syntax highlight
"Color schemes:
"[blue|delek|desert|default|darkblue|evening|elflord|industry|koehler|morning|murphy|pablo|peachpuff|ron|shine|slate|torte|zellner]
""Better schemes:
" 1) elflord
" " 2) pablo
" " 3) ron
colorscheme elflord
set background=dark
set ignorecase
set incsearch
set ls=2               " - show file name
set ts=2
set sw=2
set sts=2
set ai                 " - for disable :set noai
set expandtab
set fdm=marker
set hlsearch           " - for disable :set nohlsearch

set encoding=utf-8
set termencoding=utf-8

set rtp+=$GOROOT/misc/vim  " - Added path to golang syntax highlighter

set nocp

call pathogen#helptags()
call pathogen#incubate()

filetype plugin indent on

" :helptags
" :help tagbar
nmap <F8> :TagbarToggle<CR>

" :helptags
" :help NERD_tree.txt
map <C-n> :NERDTreeToggle<CR>

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N
" выключить подсветку: повесить на горячую клавишу Ctrl-F8
nnoremap <S-F8> :nohlsearch<CR>
" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" - enable syntax formatting for Dockerfile
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

" - enable syntax formatting for GO (golang.org)
au BufRead,BufNewFile *.go set filetype=go
au BufWritePost *.go !gofmt -w %
au BufWritePost *.go edit
au BufWritePost *.go set filetype=go

" - enable syntax highlight for Twig HTML template
au BufNewFile,BufRead *.html.twig set filetype=html

" - enable syntax highlight for FLEX and ActionScript
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

" - check syntax for PHP after save
au BufWritePost *.php !php -l %

" :call XmlFmt() - for formatting XML   |  apt-get install libxml2-utils    ->  /usr/bin/xmllint
function! XmlFmt()
  :silent 1,$!xmllint --format --recover - 2>/dev/null
endfunction

" :call JsonFmt() - for formatting JSON |  apt-get install libjson-pp-perl  ->  /usr/bin/json_pp
function! JsonFmt()
  :silent 1,$!json_pp -f json -json_opt pretty,utf8,allow_bignum 2>/dev/null
endfunction

"function! Count( word )
"  redir => cnt
"  silent exe '%s/' . a:word . '//gn'
"  redir END
"
"  let res = strpart(cnt, 0, stridx(cnt, ' '))
"  return res
"endfunction

function! JsonCompact()
  retab
  :silent! %s/\n//g
  :silent! %s/\r//g
  :silent! %s/{\s\+"/{"/g
  :silent! %s/":\s\+"/":"/g
  :silent! %s/"\s\+:"/":"/g
  :silent! %s/":\s\+{/":{/g
  :silent! %s/":\s\+\[/":\[/g
  :silent! %s/":\s\+\(\d\+\)/":\1/g
  :silent! %s/",\s\+"/","/g
  :silent! %s/\(\d\+\),\s\+"/\1,"/g
  :silent! %s/"\s\+}/"}/g
  :silent! %s/"\s\+\]/"\]/g
  :silent! %s/},\s\+"/},"/g
  :silent! %s/\(\d\+\)\s\+}/\1}/g
  :silent! %s/}\s\+}/}}/g
  :silent! %s/}\s\+}/}}/g
endfunction

" :call GoFmt() - for formatting Go
function! GoFmt()
  :execute "!gofmt -w %"
  :execute "edit"
  :execute "set filetype=go"
endfunction

" :call HexDump() - make a hexdump
function! HexDump()
  :%!xxd
  :set ft=xxd
endfunction

" :call HexReverse() - reverse operation: convert (or patch) hexdump into binary.
function! HexReverse()
  :%!xxd -r
endfunction

" :retab - replace tabs to spaces
" :%s/\s\+$//g - delete all spaces in end of line
" :set number - show number of line
" :set nonumber - hide number of line
" :SQLUFormatter - formatting SQL

" [Auto-Complete PHP]
" Enable in vim:
"   :set omnifunc=phpcomplete#CompletePHP
" Enable on ~/.vimrc level
"   autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" For comment block of code
vnoremap <silent> // :s#^#//#<cr>:noh<cr>
vnoremap <silent> -// :s#^//##<cr>:noh<cr>

