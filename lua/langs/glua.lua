local lsp = require("lsp-zero")

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = {
                    "/home/pierce/LuaAddons/glua/"
                }
            },
            runtime = {
                special = {
                    include = "require"
                },
                version = "Lua 5.1",
            }
        }
    }
})
