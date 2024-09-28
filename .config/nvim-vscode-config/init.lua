-- TODO: make this be lazyvim and vscode compatible
-- Set the leader key to space
vim.g.mapleader = " "

-- Map <leader>w to :w
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- unnamedplus: This tells Neovim to use the + register (system clipboard) for all yank, delete, change, and put operations.
vim.opt.clipboard = 'unnamedplus'
