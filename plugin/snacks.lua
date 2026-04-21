vim.pack.add({
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

local header = [[
██████╗ ████████╗██╗    ██╗    ██╗    ██╗   ██╗███████╗███████╗    ██╗   ██╗██╗███╗   ███╗
██╔══██╗╚══██╔══╝██║    ██║    ██║    ██║   ██║██╔════╝██╔════╝    ██║   ██║██║████╗ ████║
██████╔╝   ██║   ██║ █╗ ██║    ██║    ██║   ██║███████╗█████╗      ██║   ██║██║██╔████╔██║
██╔══██╗   ██║   ██║███╗██║    ██║    ██║   ██║╚════██║██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝   ██║   ╚███╔███╔╝    ██║    ╚██████╔╝███████║███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝    ╚═╝    ╚══╝╚══╝     ╚═╝     ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                         erm actually it's neovim ... 🤓👆]]

require("snacks").setup({
    bigfile = {},
    explorer = {},
    input = {},
    lazygit = {},
    notifier = {},
    scope = {},
    terminal = {},
    image = { enabled = false },
    dashboard = {
        enabled = true,
        width = 40,
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
        },
        preset = {
            header = header,
            keys = {
                {
                    icon = "󰱼 ",
                    key = "f",
                    desc = "Find File",
                    action = ":lua Snacks.dashboard.pick('files')",
                },
                {
                    icon = "󱎸 ",
                    key = "g",
                    desc = "Grep Text",
                    action = ":lua Snacks.dashboard.pick('live_grep')",
                },
                { icon = "󰚰 ", key = "u", desc = "Update Plugins", action = ":lua vim.pack.update()" },
                { icon = "󰏓 ", key = "m", desc = "Mason Tools", action = "<cmd>Mason<cr>" },
                {
                    icon = "󰒓 ",
                    key = "c",
                    desc = "Configure Vim",
                    action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                },
                { icon = "󰈆 ", key = "q", desc = "Quit Vim", action = ":qa" },
            },
        },
    },
    indent = {
        enabled = true,
        indent = { char = "▍" },
        scope = { char = "▍", underline = true },
    },
    picker = {
        enabled = true,
        win = {
            input = {
                keys = {
                    ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                    ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                    ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                    ["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                },
            },
        },
    },
})

vim.keymap.set("n", "<leader>e", function()
    Snacks.explorer()
end, { desc = "[E]xplorer" })
vim.keymap.set("n", "<leader>fd", function()
    Snacks.picker.diagnostics()
end, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>ff", function()
    Snacks.picker.files()
end, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>fg", function()
    Snacks.picker.grep()
end, { desc = "[G]rep files" })
vim.keymap.set("n", "<leader>fh", function()
    Snacks.picker.help()
end, { desc = "[H]elp Pages" })
vim.keymap.set("n", "<leader>fk", function()
    Snacks.picker.keymaps()
end, { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>fs", function()
    Snacks.picker.lsp_symbols()
end, { desc = "[S]ymbols" })
vim.keymap.set("n", "<leader>ft", function()
    Snacks.picker.todo_comments()
end, { desc = "[T]odo" })
vim.keymap.set("n", "<leader>fu", function()
    Snacks.picker.undo()
end, { desc = "[U]ndo history" })
vim.keymap.set("n", "<leader>gg", function()
    Snacks.gitbrowse()
end, { desc = "[G]it Repo" })
vim.keymap.set("n", "gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "[D]efinition" })
vim.keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { nowait = true, desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "<leader>gr", function()
    Snacks.picker.lsp_references()
end, { nowait = true, desc = "[R]eferences" })
vim.keymap.set("n", "<leader>lg", function()
    Snacks.lazygit()
end, { desc = "Lazy[G]it" })
vim.keymap.set("n", "<leader>q", function()
    Snacks.bufdelete()
end, { desc = "[Q]uit current buffer" })
vim.keymap.set("n", "<leader>$", function()
    Snacks.terminal()
end, { desc = "[T]erminal" })
