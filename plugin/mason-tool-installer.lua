vim.pack.add({
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/mason-org/mason.nvim",
})

require("mason-tool-installer").setup({
    auto_update = true,
    ensure_installed = {
        "bash-language-server", -- Bash LSP
        "bibtex-tidy", -- BibTeX formatter
        "debugpy", -- Python DAP
        "gitlab-ci-ls", -- Gitlab CI LSP
        -- "harper-ls", -- English grammar checker
        "latexindent", -- LaTeX formatter
        "ltex-ls-plus", -- Grammar, style & spell checker
        "lua-language-server", -- Lua LSP
        "prettier", -- Many languages formatter
        "ruff", -- Python formatter + linter
        "shellcheck", -- Bash linter
        "shfmt", -- Bash formatter
        "stylua", -- Lua formatter
        "tombi", -- TOML LSP
        "ty", -- Python type checker + LSP
        "yaml-language-server", -- YAML LSP
    },
})
