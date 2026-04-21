vim.pack.add({
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/snacks.nvim",
})

require("bufferline").setup({
    options = {
        close_command = function(n)
            Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
            Snacks.bufdelete(n)
        end,
        left_mouse_command = "buffer %d",
        middle_mouse_command = "BufferLineTogglePin",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "snacks_layout_box",
                text = "󰙅 File Explorer",
                separator = true,
            },
        },
        separator_style = "slope",
    },
})

vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        vim.schedule(function()
            pcall(nvim_bufferline)
        end)
    end,
})

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
