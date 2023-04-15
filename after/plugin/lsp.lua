local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "gopls"
})

-- lang specific config
-- TODO figure out howto conditionally load seperate config for glua and neovim lua
-- lsp.nvim_workspace()
require("langs.glua")
require("langs.go")

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

lsp.on_attach(function(client, bufnr)
    lsp_format_on_save(bufnr)
end)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = nil,
    ["<S-Tab>"] = nil,
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
