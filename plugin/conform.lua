vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
    format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
    formatters_by_ft = {
        bash = { "shfmt" },
        bib = { "bibtex-tidy" },
        css = { "prettier" },
        html = { "superhtml" },
        json = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "ruff_organize_imports", "ruff_format" },
        sh = { "shfmt" },
        tex = { "latexindent" },
        toml = { "tombi" },
        yaml = { lsp_format = "prefer" },
    },
})

vim.keymap.set("n", "<leader>cf", function()
    require("conform").format()
end, { desc = "[F]ormat buffer" })
