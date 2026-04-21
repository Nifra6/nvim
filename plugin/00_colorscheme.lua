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

-- Get local kitten theme
local kitty_theme = get_kitty_theme()
local theme_is_tokyonight = kitty_theme == "Tokyo Night Day" or kitty_theme == "Tokyo Nifra Day"
local theme_is_catppuccin = kitty_theme == "Catppuccin-Latte"

require("tokyonight").setup({
    transparent = theme_is_tokyonight,
})
require("catppuccin").setup({
    transparent_background = theme_is_catppuccin,
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

if theme_is_tokyonight then
    vim.cmd.colorscheme("tokyonight-day")
else
    vim.cmd.colorscheme("catppuccin")
end
