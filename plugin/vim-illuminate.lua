vim.pack.add({ "https://github.com/RRethy/vim-illuminate" })

vim.cmd(":IlluminatePause")
vim.keymap.set("n", "<leader>i", "<cmd>IlluminateToggle<cr>", { desc = "[I]lluminate" })
