" Copyright by Andrea Mistrali <am@am.cx>
" First version: Who knows?
" Last modified: 2009-04-01T16:55:05 CEST
"
" Synopsis: Templating system for vim
" 
" $Id$
"
" Remember to define in your vimrc the following var
" let g:fullname = 'Your Full Name'
" let g:email = 'your.email@address'
"
" Skeleton files could contain (in the first 20 lines) the following
" 'vars':
"   @@LONGNAME@@ - replaced by g:fullname
"   @@EMAIL@@    - replaced by g:email
"   @@DESCR@@    - Synopsis of file (asked by this plugin
"   @@crdate@@   - replaced by creation date
"   2009-04-01T17:03:00 CEST   - replaced by last modification date

" Define template directory
let g:skeletons = '~/.vim/templates'

" Preserve template files
augroup newfiles
  " First we load templates for the file type
  autocmd BufNewFile  *	ks|call OpenFile()|'s

  " Update of "Last Modified" date on writing
  autocmd BufWritePre,FileWritePre *   ks|call LastMod()|'s

  " Protect templates and plugin, removing write commands
  autocmd BufRead,BufNewFile ~/.vim/templates/* au! newfiles
  autocmd BufRead,BufNewFile */skeleton.vim au! newfiles
  autocmd BufWritePre,FileWritePre */skeleton.vim au! newfiles

  " Reload .vimrc, after modifications
  autocmd BufWritePost ~/.vimrc   so ~/.vimrc
  if has("gui_running")
    autocmd BufWritePost ~/.gvimrc   so ~/.gvimrc
  endif

  " Set up python support
augroup END


" Function to modify "Last Modified" date. Works on first N lines
function! LastMod()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  execute "1," . l . "s/@@lmdate@@/" .
        \ strftime("%FT%X %Z") . "/e"
endfunction

" Function to open a file and set some defaults
function! OpenFile()
  let s:filename=expand("<afile>")
  let l:ext=fnamemodify(s:filename, ":e")
  let l:skel = g:skeletons."/skeleton.".l:ext
  if filereadable(fnamemodify(l:skel,":p"))
    execute "0r" l:skel
    let s:syn=input("Synopsis: ")
    if line("$") > 20
      let l = 20
    else
      let l = line("$")
    endif
    execute "1," . l . "s/@@DESCR@@/" .
          \ s:syn
    execute "1," . l . "s/@@crdate@@/" .
        \ strftime("%FT%X %Z") . "/e"
    execute "1," . l . "s/@@LONGNAME@@/" .
        \ g:fullname . "/e"
    execute "1," . l . "s/@@EMAIL@@/" .
        \ g:email . "/e"
  endif
endfunction

