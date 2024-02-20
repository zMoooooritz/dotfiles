
vim.keymap.set("n", "<leader>d", ":Neotree toggle<CR>")

require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    window = {
        position = "left",
        width = 50,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
        }
    },
})
