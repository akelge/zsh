" TEMPLATE SYSTEM FOR VIM
"
" Preserve template files
augroup newfiles
	" First we load templates for the file type
	autocmd BufNewFile  *	ks|call OpenFile()|'s

	" Update of "Last Modified" date on writing
	autocmd BufWritePre,FileWritePre *   ks|call LastMod()|'s

	" Protect templates, removing write commands
	autocmd BufRead,BufNewFile ~/.vim/templates/* au! newfiles

	" Reload .vimrc, after modifications
	autocmd BufWritePost ~/.vimrc   so ~/.vimrc
	if has("gui_running")
		autocmd BufWritePost ~/.gvimrc   so ~/.gvimrc
	endif

	" Set up python support
	au FileType python source ~/.vim/addon/python.vim 
augroup END


" Function to modify "Last Modified" date. Works on first 10 lines
function! LastMod()
	if line("$") > 20
		let l = 20
	else
		let l = line("$")
	endif
	execute "1," . l . "g/Last modified: /s/Last modified: .*/Last modified: " .
				\ strftime("%d:%b:%Y %H:%M")
endfunction

" Function to open a file and set some defaults
function! OpenFile()
	let s:filename=expand("<afile>")
	let l:ext=fnamemodify(s:filename, ":e")
	let l:skel = "~/.vim/templates/skeleton.".l:ext
	if filereadable(fnamemodify(l:skel,":p"))
		execute "0r" l:skel
		let s:syn=input("Synopsis: ")
		if line("$") > 20
			let l = 20
		else
			let l = line("$")
		endif
		execute "1," . l . "g/First version: /s/First version: .*/First version: ".
		\ strftime("%d:%b:%Y %H:%M") 
		execute "1," . l . "g/Synopsis: /s/Synopsis: .*/Synopsis: ".
		\ s:syn
	endif
endfunction

