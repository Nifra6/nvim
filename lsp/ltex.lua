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
}
