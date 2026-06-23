vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/folke/lazydev.nvim",
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<Enter>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-p>"] = { "snippet_backward", "fallback_to_mappings" },
        ["<C-n>"] = { "snippet_forward", "fallback_to_mappings" },
    },
    completion = {
        trigger = { show_in_snippet = true },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
            python = { "lsp", "snippets" },
            tex = { "omni", "snippets" }, -- VimTeX completion is in omni
            lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
    },
})
