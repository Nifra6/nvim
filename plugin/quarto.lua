vim.pack.add({
    "https://github.com/quarto-dev/quarto-nvim",
    "https://github.com/jmbuhr/otter.nvim",
})

require("quarto").setup()

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "quarto" },
    callback = function(ev)
        vim.keymap.set("n", "<leader>cp", "<Cmd>QuartoPreview<CR>", { desc = "Quarto [P]review", buffer = ev.buf })
    end,
})
