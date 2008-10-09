" Converts a file to PDF and display it (only on OS X)
function! ToPDF()
	"define PS file name
	let psname= "/tmp/" . expand("%:t:r") . ".ps"
	"save colorscheme name
	let g:colorname=g:colors_name
	execute "write"
	execute "colorscheme default"
	execute "hardcopy > " . l:psname
	execute "silent !launch -w " . l:psname
	execute "silent !rm " . l:psname
	execute "colorscheme" g:colorname
	redraw!
endfunction

" Set up menu for the function
an 10.520 &File.-SEP3-      <Nop>
an 10.530 &File.&ToPDF      :call ToPDF()<CR>
vunmenu   &File.&ToPDF
vnoremenu &File.&ToPDF      :call ToPDF()<CR>

" Zoom in/out of gvim
function! Zoom()
	if has("gui_running")
		if &guifont =~ 'Monaco:h12'
			set guifont=Monaco:h9
			set lines=70
		else
			set guifont=Monaco:h12
			set lines=50
		endif
	endif
endfunction
