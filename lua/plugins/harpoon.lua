local keymap = vim.keymap
local keymap_options = require("utils.core").keymap_options

return {
    {
        "theprimeagen/harpoon",
        enabled = function()
            return (not vim.g.vscode)
        end,
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            keymap.set("n", "<leader>a", mark.add_file, keymap_options({ desc = "Harpoon a file" }))
            keymap.set("n", "<C-h>", ui.toggle_quick_menu, keymap_options({ desc = "Show harpooned list" }))

            keymap.set("n", "<C-j>", function() ui.nav_file(1) end, keymap_options({ desc = "Jump to harpoon 1" }))
            keymap.set("n", "<C-k>", function() ui.nav_file(2) end, keymap_options({ desc = "Jump to harpoon 2" }))
            keymap.set("n", "<C-l>", function() ui.nav_file(3) end, keymap_options({ desc = "Jump to harpoon 3" }))
            keymap.set("n", "<C-;>", function() ui.nav_file(4) end, keymap_options({ desc = "Jump to harpoon 4" }))
        end
    }
}
