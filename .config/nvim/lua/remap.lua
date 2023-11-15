
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>H", ":set hlsearch!<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<leader>g", ":vertical rightbelow Git<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<F2>", ":set nonumber!<CR>:set relativenumber!<CR>")
vim.keymap.set("n", "<F3>", ":set list!<CR>")
vim.keymap.set("n", "<F4>", ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>")

local spell_index = 0
vim.keymap.set("n", "<F6>", function ()
    if spell_index == 0 then
        vim.cmd("setlocal spell spelllang=de_20")
    elseif spell_index == 1 then
        vim.cmd("setlocal spell spelllang=en_us")
    else
        vim.cmd("setlocal nospell")
    end
    spell_index = (spell_index + 1) % 3
end)

vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

