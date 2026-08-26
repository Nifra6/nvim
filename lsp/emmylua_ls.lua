return {
    cmd = { "emmylua_ls" },
    filetypes = { "lua" },
    root_markers = { { ".emmyrc.json", ".luarc.json" }, ".git" },
    settings = {
        runtime = {
            version = "LuaJIT",
        },
    },
}
