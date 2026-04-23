vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    "https://github.com/letieu/harpoon-lualine",
})

require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    extensions = (function()
        local snacks_explorer = {
            sections = {
                lualine_a = {
                    function()
                        return "󰙅 File Explorer"
                    end,
                },
                lualine_z = { { "branch", icon = "󰘬" } },
            },
            filetypes = { "snacks_picker_list" },
        }
        return { "lazy", "mason", "neo-tree", "trouble", snacks_explorer }
    end)(),
    sections = {
        lualine_a = { "mode" },
        lualine_b = { { "harpoon2", icon = "󱡅 " } },
        lualine_c = {
            {
                "filename",
                file_status = true,
                newfile_status = true,
                path = 1,
                symbols = { modified = "󰏫 ", readonly = "󰌾 ", newfile = "󰎔 ", unnamed = "󰡯 " },
            },
            "diff",
            { "diagnostics", symbols = { error = "󰅙 ", warn = "󱠇 ", info = "󰋼 ", hint = "󰸥 " } },
        },
        lualine_x = { "location", "progress" },
        lualine_y = {
            {
                "lsp_status",
                icon = "󰖷",
                symbols = {
                    spinner = { "", "", "", "", "", "" },
                    done = "󰦕",
                    separator = ",",
                },
            },
            { "filetype", icon_only = true },
        },
        lualine_z = { { "branch", icon = "󰘬" } },
    },
})
