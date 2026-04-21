vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
require("colorizer").setup({

    lazy_load = true,
    options = { parsers = { css = true } },
})
