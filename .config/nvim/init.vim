set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab
set number relativenumber
set clipboard=unnamed
set nocompatible
set nowrap
let mapleader=','
set foldmethod=syntax
nnoremap <space> za
set foldlevel=120
set encoding=utf-8
set iskeyword+=-
set incsearch
syntax on
filetype plugin indent on

" Custom Binds

" show spacings and tabs
noremap <F2> :call ToggleNumber()<CR>
function! ToggleNumber()
    :set nonumber!
    :set relativenumber!
endfunction

noremap <F3> :set list!<CR>

noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

noremap <F5> :NERDTreeToggle<CR>

" auto add closing backets
inoremap {<CR>  {<CR>}<Esc>O

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround' " Makes it easy to replace things
Plug 'tpope/vim-commentary' " makes commenting much easier
Plug 'ervandew/supertab' " autocompletion if you press tab
Plug 'takac/vim-hardtime' " stops you from scrolling down with up and down keys

Plug 'sheerun/vim-polyglot' " highlighting for many languages

Plug 'lervag/vimtex'

Plug 'dracula/vim' " dracula color theme

Plug 'scrooloose/nerdtree' " File explorer

Plug 'ap/vim-css-color' " colorizer

Plug 'vim-airline/vim-airline' " the airline at the bottom of vim
Plug 'vim-airline/vim-airline-themes' " the airline-themes

call plug#end()

" Colortheme and airline
let g:solarized_italic=0
colorscheme dracula
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline_luna_bg='dark'
set t_Co=256
set laststatus=2
let g:airline_exclude_preview = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'

" setting for haskell syntax highlighting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" settings for hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 5000
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = []
let g:list_of_insert_keys = []

let g:vimtex_view_method = 'zathura'

au FileType perl set filetype=prolog

