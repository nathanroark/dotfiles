return {
    {
      "williamboman/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonUpdate" },
      config = function(_, opts)
        require('mason').setup(opts)
      end
    }
  }