vim.pack.add({
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

require("todo-comments").setup({
    signs = true,
    sign_priority = 8,
})
