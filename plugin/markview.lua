vim.pack.add({
    "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "quarto" },
    callback = function(ev)
        vim.keymap.set(
            "n",
            "<leader>cp",
            "<Cmd>Markview toggle<Enter>",
            { desc = "[P]review in nvim", buffer = ev.buf }
        )
    end,
})
