local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves up down in visual selection" })

vim.keymap.set("v", "<C-d>", "<C-d>zz", { desc = "Moves down in buffer with cursor centered" })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { desc = "Moves up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")


vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Clipboard things
-- Paste without replacing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)

-- deltes without copying
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true})

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Q", "<nop>") -- turned off
vim.keymap.set("n", "x", '"_x', opts) -- prevents deleted characters from copying to clipboard

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
        callback = function()
                vim.highlight.on_yank()
        end,
})

-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- go to prev
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- open current tab in new tab

-- split
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) 
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make spluts equal size" }) 
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
        local filePath = vim.fn.expand("%:~") -- gets the file path relative to the home directory
        vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
        print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
