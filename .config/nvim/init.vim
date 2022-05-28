
"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'takac/vim-hardtime'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-obsession'
Plug 'xolox/vim-notes'
Plug 'lervag/vimtex'
Plug 'dracula/vim'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""""""""""""""""""
" Basic settings "
""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab
set number relativenumber
set clipboard=unnamed
set nocompatible
set nowrap
let mapleader='ö'
set foldmethod=syntax
nnoremap <space> za
set foldlevel=120
set encoding=utf-8
set iskeyword+=-
set incsearch
set splitbelow
set splitright
syntax on
filetype plugin indent on
runtime macros/matchit.vim

""""""""""""""""
" Custom Binds "
""""""""""""""""
noremap <F2> :call ToggleNumber()<CR>
function! ToggleNumber()
    :set nonumber!
    :set relativenumber!
endfunction

noremap <F3> :set list!<CR>

noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

noremap <F6> :call ToggleSpellChecking()<CR>

nmap <F8> :TagbarToggle<CR>

let g:is_spell_checking = 0

function! ToggleSpellChecking()
    if g:is_spell_checking
        setlocal nospell
        let g:is_spell_checking = 0
    else
        setlocal spell spelllang=de_20
        let g:is_spell_checking = 1
    endif
endfunction

inoremap {<CR>  {<CR>}<Esc>O

" make n/N always go in the same direction
nnoremap <expr> n 'Nn'[v:searchforward] . "zv"
nnoremap <expr> N 'nN'[v:searchforward] . "zv"

nnoremap <leader>h :noh<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""

" colortheme
let g:solarized_italic=0
colorscheme dracula
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" vim-airline
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

" vim-airline - unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'

" vim-hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 10
let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = []
let g:list_of_insert_keys = []

" vimtex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

" ctrlp.vim
let g:ctrlp_show_hidden = 1

" vim-go
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
:augroup gogroup
    :au FileType go set fileformat=unix | set nolist
    :au FileType go nnoremap <leader>lr :GoRun<Enter>
    :au FileType go nnoremap <leader>li :GoInstall<Enter>
    :au FileType go nnoremap <leader>lt :GoTest<Enter>
    :au FileType go nnoremap <leader>lb :GoBuild<Enter>
    :au FileType go nnoremap <leader>ld :GoDoc<Enter>
    :au FileType go nnoremap <leader>lD :GoDocBrowser<Enter>
    :au FileType go nnoremap <leader>ll :GoMetaLinter<Enter>
:augroup END

" vim-notes
let g:notes_directories = ['~/.vim/misc/notes/']

