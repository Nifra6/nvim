vim.pack.add({
    "https://github.com/Mirsmog/real-icons.nvim",
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/folke/snacks.nvim",
})

vim.api.nvim_create_user_command("InstallCatppuccinIcons", function()
    vim.fn.system("bash " .. vim.fn.expand("~/.config/nvim/scripts/download_catppuccin_icons.bash"))
    if vim.v.shell_error ~= 0 then
        print("Failed to install icons.")
    else
        print("Catppuccin icons installed. Restarting nvim.")
        vim.cmd("restart")
    end
end, {})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "real-icons" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("real-icons")
            end
            vim.cmd("RealIcons")
        end
    end,
})

require("real-icons").setup({
    integrations = {
        snacks_picker = true,
        bufferline = true,
        lualine = false, -- Manual integration offer a better control
    },
    pack = "catppuccin-latte",
    packs = {
        ["catppuccin-latte"] = {
            type = "vscode",
            path = vim.fn.expand("~/.config/nvim/icons/catppuccin"),
            theme = "catppuccin-latte",
        },
    },
})

vim.keymap.set("n", "<leader>li", "<cmd>RealIcons packs<cr>", { desc = "[I]cons" })
