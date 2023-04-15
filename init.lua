-- line numbers
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.showcmd = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
-- vim.opt.termguicolors = true
vim.opt.wrap = false

require("style")
vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup()

vim.api.nvim_create_user_command('Tree',
    function(opts)
        vim.cmd.NvimTreeFocus()
    end,
    { nargs = 0 }
)

require("remap")
