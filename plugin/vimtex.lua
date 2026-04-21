vim.pack.add({ "https://github.com/lervag/vimtex" })

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = { out_dir = "build" }
vim.g.vimtex_quickfix_mode = 0 -- Do not open automatically the quickfix buffer on compilation

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function(ev)
        vim.keymap.set(
            "n",
            "<leader>cp",
            "<Cmd>VimtexCompile<Enter>",
            { desc = "[P]review the document", buffer = ev.buf }
        )
        vim.keymap.set(
            "n",
            "<leader>cg",
            "<Cmd>VimtexView<Enter>",
            { desc = "[G]o to this line in preview", buffer = ev.buf }
        )
    end,
})
