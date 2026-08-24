local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE: Plugins management
map("n", "<leader>ls", function()
    vim.pack.update(nil, { target = "lockfile" })
end, { desc = "[S]ync plugins" })
map("n", "<leader>lu", function()
    vim.pack.update()
end, { desc = "[U]pdate plugins" })

-- NOTE: Use CTRL+<hjkl> to switch between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Clear highlight in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- NOTE: Toggle diagnostic virtual lines
map("n", "td", function()
    local new_config = vim.diagnostic.config().virtual_lines
    new_config.current_line = not new_config.current_line
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

-- NOTE: Jumping
map("n", "<leader>gb", "<C-t>", { desc = "[B]ack" })
