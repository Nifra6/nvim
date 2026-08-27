-- Enabled LSP configs
local lsp_configs = {
    "bashls", -- Bash LSP
    "cssls", -- CSS LSP
    "emmylua_ls", -- Lua LSP
    "gitlab_ci_ls", -- GitLab CI plugin for yamlls
    "ltex", -- Grammar, style & spell checker
    "ruff", -- Python formatter + linter
    "rumdl", -- Markdown LSP
    "sshls", -- SSH config LSP
    "superhtml", -- HTML LSP
    "tombi", -- TOML LSP
    "ty", -- Python type checker + LSP
    "yamlls", -- YAML LSP
}

-- Enable specified LS
for _, name in pairs(lsp_configs) do
    vim.lsp.enable(name)
end
