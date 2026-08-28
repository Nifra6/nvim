local create_autocmd = vim.api.nvim_create_autocmd

-- NOTE: Highlight when yanking (copying) text
create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- NOTE: Jump in help
create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.keymap.set("n", "<leader>gd", "<C-]>", { buffer = true, desc = "Go to tag" })
    end,
})
