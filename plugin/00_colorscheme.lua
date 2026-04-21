vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim",
})

require("tokyonight").setup({ transparent = true })
require("catppuccin").setup({ transparent_background = true })

vim.cmd.colorscheme("tokyonight-day")
