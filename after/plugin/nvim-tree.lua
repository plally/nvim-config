require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    }
})

vim.api.nvim_create_user_command('Tree',
    function(_)
        vim.cmd.NvimTreeFocus()
    end,
    { nargs = 0 }
)
