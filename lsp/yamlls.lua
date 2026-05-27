return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.gitlab" },
    root_markers = { ".git" },
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
            format = { enable = true },
            schemas = {
                ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.yaml",
            },
        },
    },
}
