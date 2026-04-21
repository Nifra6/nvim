vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
    signcolumn = false,
    numhl = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 0,
        ignore_whitespace = true,
    },
})

vim.keymap.set("n", "<leader>b", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "[B]lame" })
