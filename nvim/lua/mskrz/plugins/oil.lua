return {
        "stevearc/oil.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
                require("oil").setup({
                        defult_file_explorer = true, -- start up nvim with oil instead of netrw,
                        columns = {
                                "icon",
                               -- "size",
                               -- "mtime",
                               -- "permissions",
                        },
                        keymaps = {
                                ["<C-h>"] = false, -- prevents to close oil
                                ["<C-c>"] = false, -- prevents to close oil
                                ["<M-h>"] = "actions.select_split", -- splits
                                ["q"] = "actions.close",
                        },
                        delete_to_trash = true,
                        view_options = {
                                show_hidden = true,
                        },
                        skip_confirm_for_simple_edits = true,
                })

                -- keymaps for oil
                vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory over current active window"})
                vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "toggle float oil"})
                vim.api.nvim_create_autocmd("FileType",{
                        pattern = "oil",
                        callback = function()
                                vim.opt_local.cursorline = true
                        end,
                })
        end
}
