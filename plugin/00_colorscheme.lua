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

local function get_ghostty_theme()
    local handle = io.popen("ghostty +show-config 2>/dev/null | grep '^theme'")
    if not handle then
        return nil
    end
    local result = handle:read("*l")
    handle:close()
    return result and result:match("^theme%s*=%s*(.+)")
end

local function get_terminal_emulator_theme()
    local term = os.getenv("TERM_PROGRAM")
    local result = nil
    if term == "ghostty" then
        result = get_ghostty_theme()
    elseif term == "kitty" then
        result = get_kitty_theme()
    end
    if result == "TokyoNight Day" or result == "Tokyo Night Day" then
        return "TokyoNight Day"
    end
    if result == "Catppuccin Latte" or result == "Catppuccin-Latte" then
        return "Catppuccin Latte"
    end
end

local te_theme = get_terminal_emulator_theme()

require("catppuccin").setup({
    transparent_background = te_theme == "Catppuccin Latte",
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
require("tokyonight").setup({
    transparent = te_theme == "TokyoNight Day",
})
vim.g.everforest_transparent_background = 0

-- Fallback to catppuccin when theme can't be detected (SSH, unknown terminal, ...)
if te_theme == "TokyoNight Day" then
    vim.cmd.colorscheme("tokyonight-day")
else
    vim.cmd.colorscheme("catppuccin")
end
