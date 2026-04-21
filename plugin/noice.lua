vim.pack.add({
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
})

require("noice").setup({
    cmdline = { enabled = true }, -- Noice floating window for commands
    presets = {
        bottom_search = false, -- Search same place than the command line
        command_palette = true, -- Command line at the top
        lsp_doc_border = true, -- Add border around documentation hover
    },
})
