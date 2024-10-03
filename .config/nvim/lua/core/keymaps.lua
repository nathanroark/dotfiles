-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Map <leader>w to :w (save)
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Map <leader>q to :q (quit)
map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

-- Windowing
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Nvim Tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>o", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree focus window" })
