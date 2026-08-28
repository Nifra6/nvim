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

-- Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
        end

        -- NOTE: Symbols
        map("<leader>r", vim.lsp.buf.rename, "[R]ename symbol")

        -- NOTE: Code actions
        map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ctions")
    end,
})

-- NOTE: Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

-- NOTE: Enable underline for LTeX in LaTeX files
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and (client.name == "texlab" or client.name == "ltex") then
            local ns = vim.lsp.diagnostic.get_namespace(args.data.client_id)
            vim.diagnostic.config({
                underline = true,
            }, ns)
        end
    end,
})
