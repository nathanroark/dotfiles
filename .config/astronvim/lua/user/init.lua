local function add_missing_imports()
	vim.api.nvim_create_user_command('TSAddMissingImports', function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.addMissingImports" }
			}
		})
	end, {})
end

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
	polish = function()
		-- TODO:: this should work better but now it takes npm packaes first then aliases
		add_missing_imports()
	end,
	highlights = {
		init = function()
			local utils = require("user.utils")
			local red = 0xe06c75
			local green = 0x04260f

			return {
				DiffAdd = { bg = utils.dim(green) },
				DiffDelete = { bg = utils.dim(red) },
			}
		end,
	},
	options = {
		opt = {
			showtabline = 0,    -- don't show tabline
			laststatus = 0,     -- Hide statusline
			spell = false,      -- Enable spell checking
			swapfile = false,   -- Disable swap files
			title = true,       -- Allow nvim to update the term titlerelativenumber
			scrolloff = 8,      -- keep 8 lines above and below cursor
			cursorline = false, -- highlight current line
			relativenumber = true, -- show relative line numbers
		},
	},
	mappings = {
		n = { -- disable <leader>b mappings
			["<leader>b"] = false,
			["<leader>bb"] = false,
			["<leader>bd"] = false,
			["<leader>b\\"] = false,
			["<leader>b|"] = false,
		},
	},
	plugins = {
		{
			"rebelot/heirline.nvim",
			opts = function(_, opts)
				opts.tabline = nil -- remove tabline
				return opts
			end,
		},
	},
	lsp = {
		formatting = {
			timeout_ms = 20000,
			format_on_save = {
				enabled = true, -- enable format on save
			},
		},
		config = {
			-- TODO: move this is a file?
			-- tailwindcss = {
			-- 	on_attach = function(client, bufnr)
			-- 		local tw_highlight = require("tailwind-highlight")
			-- 		tw_highlight.setup(client, bufnr, {
			-- 			single_column = false,
			-- 			mode = "background",
			-- 			debounce = 200,
			-- 		})
			-- 	end
			-- }
		}
	},
	updater = {
		channel = "stable",
	},
	-- colorscheme = "astrodark",
	-- colorscheme = "oxocarbon",
	-- colorscheme = "catppuccin-mocha"
	-- colorscheme = "rose-pine",
	-- colorscheme = "boo",
	-- colorscheme = "kanagawa",
	-- colorscheme = "kanagawa-dragon",
	colorscheme = "tokyonight-night",
	-- colorscheme = "tokyonight-moon",
	-- colorscheme = "moonfly",
	-- colorscheme = "flexoki-neovim",
	-- colorscheme = "poimandres", -- broken
	-- colorscheme = "gruvbox",

}
