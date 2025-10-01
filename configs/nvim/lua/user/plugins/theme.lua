-- return {
-- 	-- Tokyonight theme
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		opts = { style = "night" }, -- Options: storm, night, moon, day
-- 		config = function(_, opts)
-- 			vim.cmd.colorscheme("tokyonight")
-- 		end,
-- 	},
-- 	-- Lualine status line
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		config = function()
-- 			require("lualine").setup({
-- 				options = {
-- 					icons_enabled = true,
-- 					theme = "tokyonight",
-- 					component_separators = { left = "", right = "" },
-- 					section_separators = { left = "", right = "" },
-- 				},
-- 			})
-- 		end,
-- 	},
-- }


return {
	-- Onedark theme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "darker", -- Options: dark, darker, cool, deep, warm, warmer, light
		},
		config = function(_, opts)
			require("onedark").setup(opts)
			require("onedark").load()
		end,
	},
	-- Lualine status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "onedark",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
			})
		end,
	},
}
