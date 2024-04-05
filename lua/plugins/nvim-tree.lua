local keymap = vim.keymap
local keymap_options = require("utils.core").keymap_options

return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                },
            })
            keymap.set("n", '<leader>o', '<cmd>NvimTreeToggle<CR>', keymap_options({ desc = "Open file tree" }))
        end
    }
}
