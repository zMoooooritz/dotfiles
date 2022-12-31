

vim.api.nvim_exec([[
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline_theme='base16_gruvbox_dark_hard'
	set t_Co=256
	set laststatus=2
	let g:airline_exclude_preview = 1

	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.paste = 'p'
    let g:airline_symbols.whitespace = 'Ξ'

]], false)

