-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Map <leader>w to :w (save)
map('n', '<leader>w', ':w<CR>', {    noremap = true, silent = true })

-- Map <leader>q to :q (quit)
map('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
