vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/sainnhe/everforest",
})

local function get_kitty_theme()
    local f = io.open(vim.fn.expand("~/.config/kitty/current-theme.conf"), "r")
    if not f then
        return nil
    end
    for line in f:lines() do
        local name = line:match("## name:%s+(.+)")
        if name then
            f:close()
            return name
        end
    end
    f:close()
    return nil
end

local kitty_theme = get_kitty_theme()
require("tokyonight").setup({
    transparent = kitty_theme == "Tokyo Night Day" or kitty_theme == "Tokyo Nifra Day",
})
require("catppuccin").setup({
    transparent_background = kitty_theme == "Catppuccin-Latte",
    integrations = {
        markview = true,
        blink_cmp = true,
        harpoon = true,
        mason = true,
        gitsigns = true,
        noice = true,
        dap = true,
        snacks = { enabled = true },
        lsp_trouble = true,
        illuminate = { enabled = true, lsp = true },
        which_key = true,
    },
})
vim.g.everforest_transparent_background = 0

-- vim.cmd.colorscheme("tokyonight-day")
vim.cmd.colorscheme("catppuccin")
