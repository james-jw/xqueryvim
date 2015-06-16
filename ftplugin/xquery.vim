" Vim filetype plugin file
" Language:	    XQuery
" Maintainer:	James Wright
" Last Change:  2015 June
"
" Notes: 
"    -Sets a few variables to make matchit.vim and taglist.vim work 
"     better with XQuery
"
"    -Sets the omnicomplete function to xquerycomplete.vim, which completes 
"     XQuery keywords and function names for BaseX
"     http://www.basex.org
"
"    - Added understanding of XQuery Comments

" Comment blocks always start with a (: and end with a :)
" Works for XQDoc style start comments like (:~ too.
setlocal comments=s1:(:,mb::,ex::)
setlocal commentstring=(:%s:)

" Format comments to be up to 78 characters long  (from vim.vim)
" if &tw == 0
"   setlocal tw=78
" endif

" Set 'formatoptions' to break comment lines but not other lines,  
" and insert the comment leader when hitting <CR> or using "o".     
"    see...  :h fo-table
setlocal formatoptions-=t formatoptions+=croql

if exists('&ofu')
  setlocal omnifunc=xquerycomplete#CompleteXQuery
endif

" from html.vim
if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
    \ '(:),' .
    \ '{:},' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

" :h matchit-extend  or...  http://vim-taglist.sourceforge.net/extend.html
"
"    Also, try 'ctags --list-kinds=all'   to see all the params for different
"    languages that you can pass in to this variable!
let tlist_xquery_settings = 'xquery;m:module;v:variable;f:function'

let b:undo_ftplugin = 'setlocal formatoptions<'
		\  . ' comments< commentstring< omnifunc<'
        \  . ' shiftwidth< tabstop<' 


" surround.vim    Usage: visually select text, then type Sc 
let b:surround_{char2nr("c")} = "(: \r :)"
