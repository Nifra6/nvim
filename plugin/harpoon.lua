vim.pack.add({
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    "https://github.com/nvim-lua/plenary.nvim",
})

require("harpoon").setup({ settings = { save_on_toggle = true } })

vim.keymap.set("n", "<leader>h", function()
    require("harpoon"):list():add()
end, { desc = "[H]arpoon File" })
vim.keymap.set("n", "<leader>m", function()
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon [M]enu" })

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        require("harpoon"):list():select(i)
    end, { desc = "Harpoon [" .. i .. "]" })
end
