vim.pack.add({ { src = "https://github.com/barreiroleo/ltex_extra.nvim", version = "dev" } })

require("ltex_extra").setup({
    load_langs = { "fr", "en" },
})
