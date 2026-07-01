local language_id_mapping = {
    tex = "latex",
    text = "plaintext",
}

return {
    cmd = { "ltex-ls-plus" },
    filetypes = { "markdown", "tex", "text", "quarto" },
    root_markers = { ".git" },
    get_language_id = function(_, filetype)
        return language_id_mapping[filetype] or filetype
    end,
    settings = { ltex = { language = "auto", checkFrequency = "save" } },
    on_attach = function(client, _)
        require("ltex_extra").setup({
            load_langs = { "fr-FR", "en-US" },
        })
    end,
}
