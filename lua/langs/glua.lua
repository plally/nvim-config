local lsp = require("lsp-zero")

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = {
                    "/home/pierce/LuaAddons/glua/"
                }
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                    tab_width = "4",
                    quote_style = "double",
                    max_line_length = "120",
                    insert_final_newline = "true",
                    space_inside_function_call_parentheses = "true",
                    space_inside_function_param_list_parentheses = "true",
                },
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
