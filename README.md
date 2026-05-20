# Nifra's nvim configuration

This is my daily use configuration.

## 📦 Installation

This configuration requires Neovim 0.12 or later.
Clone the repository into your config directory:

```bash
git clone git@gitlab.com:nifra/nvim.git ~/.config/nvim
```

## ✨ Structure

Main options of my configuration are in `lua/nifra/` (which is loaded by `init.lua`). If you want to see how the theme (_e.g._ the colorscheme) is set up, see `plugin/00_colorscheme.lua`.

Plugins are added, configured and activated through the built-in **vim.pack**, specified in the `plugin/` directory.

LSPs are installed with the **mason.nvim** plugin (automated with the **mason-tool-installer.nvim** plugin), configured in the `lsp/` directory and activated in `lua/nifra/lsp.lua`.

Since the configuration follows the structure of the official documentation as closely as possible, `filetype.lua`, `init.lua`, `lsp/` and `plugin/` are automatically loaded by Neovim.

The `snippets/` directory is used by the completion plugin **blink.cmp**.
