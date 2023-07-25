
vim.api.nvim_exec([[
	let g:vimtex_view_method = 'zathura'
	let g:tex_flavor = 'latex'
    let g:vimtex_compiler_method = 'latexrun'
]], false)
