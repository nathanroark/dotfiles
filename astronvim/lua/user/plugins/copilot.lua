return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            -- Nice key to accept so it wont interfere with autocomplete
            accept = "<M-l>",
            -- Nice to dismiss it
            dismiss = "<C-]>",
            -- Next suggestion
            next = "<M-]>",
            -- Prev suggestion
            prev = "<M-[>",
          },
        },
      })
    end,
  },
}
