local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "gopls"
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    servers = {
        ["lua_ls"] = { "lua" },
        ["rust_analyzer"] = { "rust" },
        ["gopls"] = { "go" },
    }
})

lsp.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = ""
})

if vim.fn.expand("$HOME/.config/nvim") == vim.fn.getcwd() then
    require("langs.nvimlua")
elseif vim.fn.isdirectory("lua/autorun") == 1 then
    require("langs.glua")
end
require("langs.go")

lsp.setup()
vim.diagnostic.config({
    virtual_text = true,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete()
    }
})
