-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map <leader>w to :w (save)
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Map <leader>q to :q (quit)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })