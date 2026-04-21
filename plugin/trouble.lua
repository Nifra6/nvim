vim.pack.add({
    "https://github.com/folke/trouble.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("trouble").setup()

vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[T]rouble" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bib", "tex" },
    callback = function(ev)
        vim.keymap.set(
            "n",
            "<leader>t",
            "<cmd>Trouble quickfix toggle<cr>",
            { desc = "VimTeX [T]rouble", buffer = ev.buf }
        )
        vim.keymap.set(
            "n",
            "<leader><c-t>",
            "<cmd>Trouble diagnostics toggle<cr>",
            { desc = "LTeX [T]rouble", buffer = ev.buf }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "trouble",
    callback = function(ev)
        vim.keymap.set("n", "<leader>t", "<cmd>Trouble toggle<cr>", { desc = "[T]rouble", buffer = ev.buf })
    end,
})
