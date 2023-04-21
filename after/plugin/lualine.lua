local lspStatus = require("lsp-status")
lspStatus.register_progress()
require("lualine").setup {
    options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = {
            "fileformat",
            "diagnostics",
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },

        },
    },
    tabline = {
        lualine_a = {
            { function() return "🦊" end, separator = { left = "" } },
        },
        lualine_b = {
            { "buffers" }
        },
        lualine_c = {},
        lualine_x = {
            { function() return lspStatus.status() end },
            { function() return lspStatus.status_progress() end },
        },
        lualine_y = {},
        lualine_z = {
            { function() return "🐱" end, separator = { right = "" } },
        }
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    extensions = {},
}
