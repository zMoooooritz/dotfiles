
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.api.nvim_exec([[
    noremap <F2> :call ToggleNumber()<CR>
    function! ToggleNumber()
        :set nonumber!
        :set relativenumber!
    endfunction

    noremap <F3> :set list!<CR>

    noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

    noremap <F6> :call ToggleSpellChecking()<CR>

    let g:spell_index = 0

    function! ToggleSpellChecking()
        if g:spell_index == 0
            setlocal spell spelllang=de_20
        elseif g:spell_index == 1
            setlocal spell spelllang=en_us
        else
            setlocal nospell
        endif
        let g:spell_index = (g:spell_index + 1) % 3
    endfunction

]], false)

