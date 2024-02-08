return {
  n = {
    ["<leader>1"] = { "<cmd>bprevious<cr>", desc = "Switch buffer backwards" },
    ["<leader>2"] = { "<cmd>bnext<cr>", desc = "Switch buffer forward" },
    -- ["<leader>h"] = false,
    ["<leader>lz"] = { "<cmd>RustDisableInlayHints<cr>", desc = "Disable Rust inlay hints" },
    ["<leader>lZ"] = { "<cmd>RustEnableInlayHints<cr>", desc = "Enable Rust inlay hints" },
  },
}
