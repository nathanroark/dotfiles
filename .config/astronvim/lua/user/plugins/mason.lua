return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "lua_ls",
        "cssls",
        "html",
        "jsonls",
        "tsserver",
        "yamlls",
        "clangd"
      },
      servers = {
        -- Ensure mason installs the server
        clangd = {
          -- signature help provider
          signature_help = false,

          -- keys = {
          --   { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          -- },
          -- capabilities = {
          --   offsetEncoding = { "utf-8" },
          -- }
        },
      },
    },

  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "eslint_d",
        "prettier",
        "beautysh",
        "clang-format",
      },
    },
  },
}
