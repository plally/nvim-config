require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.fn.expand("$HOME/LuaLibs/glua/")
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
                    align_continuous_inline_comment = "false",
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

vim.fn.jobstart("git pull origin master", { cwd = vim.fn.expand("$HOME/LuaLibs/glua") })
