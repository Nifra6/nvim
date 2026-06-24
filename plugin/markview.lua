vim.pack.add({
    "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        vim.keymap.set(
            "n",
            "<leader>cp",
            "<Cmd>Markview toggle<Enter>",
            { desc = "[P]review in nvim", buffer = ev.buf }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "quarto" },
    callback = function(ev)
        vim.cmd("Markview disable " .. ev.buf) -- BUG: Don't have any impact 🤷
        vim.keymap.set(
            "n",
            "<leader>c<C-p>",
            "<Cmd>Markview toggle<CR>",
            { desc = "[P]review in nvim", buffer = ev.buf }
        )
    end,
})
