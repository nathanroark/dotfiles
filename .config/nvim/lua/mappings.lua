require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- space w to save
map("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- space q to quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
