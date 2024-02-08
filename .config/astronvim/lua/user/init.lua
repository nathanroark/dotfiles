return {
	-- add new user interface icon
	icons = {
		VimIcon = "",
		ScrollText = "",
		GitBranch = "",
		GitAdd = "",
		GitChange = "",
		GitDelete = "",
	},
	options = {
		opt = {
			scrolloff = 8,       -- keep 8 lines above and below cursor
			cursorline = false,  -- highlight current line
			spell = false,       -- Enable spell checking
			title = true,        -- Allow nvim to update the term titlerelativenumber
			relativenumber = false, -- Disable relative line numbers
		},
	},
	lsp = {
		setup_handlers = {
			-- add custom handler
			rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end
		},
		formatting = {
			-- timeout_ms = 20000,
			format_on_save = {
				enabled = true, -- enable format on save
			},
		},
		config = {
			clangd = {
				capabilities = {
					offsetEncoding = "utf-8"
				},
			},
		},
	},
	plugins = {
		{
			"p00f/clangd_extensions.nvim", -- install lsp plugin
			init = function()
				-- load clangd extensions when clangd attaches
				local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
				vim.api.nvim_create_autocmd("LspAttach", {
					group = augroup,
					desc = "Load clangd_extensions with clangd",
					callback = function(args)
						if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
							require "clangd_extensions"
							-- add more `clangd` setup here as needed such as loading autocmds
							vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
						end
					end,
				})
			end,
		},
	},
	updater = {
		channel = "nightly",
	},
	-- colorscheme = "xcodedarkhc",
	-- colorscheme = "night-owl",
	-- colorscheme = "rose-pine",
	-- colorscheme = "github_dark_default",
	-- colorscheme = "tokyonight-night",
	colorscheme = "kanagawa",
	-- colorscheme = "astrodark",
	-- colorscheme = "oxocarbon",
	-- colorscheme = "catppuccin-mocha"
	-- colorscheme = "boo",
	-- colorscheme = "kanagawa-dragon",
	-- colorscheme = "tokyonight-moon", -- good with transparent background
	-- colorscheme = "moonfly"
	-- colorscheme = "flexoki-neovim",
	-- colorscheme = "poimandres", -- broken
	-- colorscheme = "gruvbox",

}
