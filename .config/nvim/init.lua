-- Lazy Package Manager
require("config.lazy")

-- Set the leader key to space
vim.g.mapleader = " "

-- Map <leader>w to :w
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })